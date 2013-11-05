module Jekyll
  class TeamIndex < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir  = dir
      @name = "index.html"

      self.read_yaml(File.join(base, '_layouts'), 'team.html')
      self.data['team'] = self.get_team(site)
      self.process(@name)
    end

    def get_team(site)
      {}.tap do |team|
        Dir['_team/*.yml'].each do |path|
          name   = File.basename(path, '.yml')
          config = YAML.load(File.read(File.join(@base, path)))
          type   = config['type']

          if config['active']
            team[type] = {} if team[type].nil?
            team[type][name] = config
          end
        end
      end
    end
  end

  class PersonIndex < Page
    def initialize(site, base, dir, path)
      @site     = site
      @base     = base
      @dir      = dir
      @name     = "index.html"
      self.data = YAML.load(File.read(File.join(@base, path)))
      self.data['title'] = "#{self.data['name']} | #{self.data['role']}"

      self.process(@name)
    end
  end

  class GenerateTeam < Generator
    safe true
    priority :normal

    def generate(site)
      write_team(site)
    end

    # Loops through the list of team pages and processes each one.
    def write_team(site)
      #if Dir.exists?('_team')
        Dir.chdir('_team')
        Dir["*.yml"].each do |path|
          name = File.basename(path, '.yml')
          self.write_person_index(site, "_team/#{path}", name)
        end

        Dir.chdir(site.source)
        self.write_team_index(site)
      #end
    end

    def write_team_index(site)
      team = TeamIndex.new(site, site.source, "/team")
      team.render(site.layouts, site.site_payload)
      team.write(site.dest)

      site.pages << team
      site.static_files << team
    end

    def write_person_index(site, path, name)
      person = PersonIndex.new(site, site.source, "/team/#{name}", path)

      if person.data['active']
        person.render(site.layouts, site.site_payload)
        person.write(site.dest)

        site.pages << person
        site.static_files << person
      end
    end
  end

  class AuthorsTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text   = text
      @tokens = tokens
    end

    def render(context)
      site = context.environments.first["site"]
      page = context.environments.first["page"]

      if page
        authors = page['author']
	    if authors
         authors = [authors] if authors.is_a?(String)

         "".tap do |output|
           authors.each do |author|
             data     = YAML.load(File.read(File.join(site['source'], '_team', "#{author.downcase.gsub(' ', '-')}.yml")))
             template = File.read(File.join(site['source'], '_includes', 'author.html'))
             output << Liquid::Template.parse(template).render('author' => data)
           end
          end
        end
      end
    end
  end

  class ExpertsTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text   = text
      @tokens = tokens
    end

    def render(context)
      site = context.environments.first["site"]
      page = context.environments.first["page"]   

      if page
        expertsLimit = page['expertLimit']
          expertsData = []

           "".tap do |output|
             Dir.foreach("_team") do |fname|
                if fname != "." && fname != ".."
                  data = YAML.load(File.read(File.join(site['source'], '_team', fname)))
                  
                  if data["highlighted"] == true
                    expertsData.push(data);

                    if expertsData.length == expertsLimit.to_i
                      break
                    end
                  end
                end
              end
              template = File.read(File.join(site['source'], '_includes', 'experts.html'))
              output << Liquid::Template.parse(template).render('expertsData' => expertsData)
            end        
        #end
      end
    end
  end

  class PostExcerptTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text   = text
      @tokens = tokens
    end

    def getPostUrl(title, context)
      site = context.environments.first["site"]
      posts = site['posts']

      posts.each do |post|
        if post.title == title
          return post.url
        end
      end

    end

    def render(context)
      site = context.environments.first["site"]
      # posts = site['posts'].first(3).reverse

      authors = Hash.new
      # Get authors model
      Dir.foreach("_team") do |fname|
        next if fname == "." or fname == ".."

        data = YAML.load(File.read(File.join(site['source'], '_team', fname)))
        authors[fname.chomp(File.extname(fname))] = data
      
      end

      "".tap do |output|
        # Get newest posts. Can't use site.posts because we need the md files.
        files_sorted_by_time = Dir['_posts/*'].sort_by{ |f| File.mtime(f) }.last(3)

        layoutData = []

        files_sorted_by_time.each_with_index do |post, idx|
          postRawData = YAML.load(File.read(File.join(site['source'], post)))

          #get author from post and then apply template to data.
          key = postRawData['author']
          author = authors[key]

          categoryLink = postRawData['category'].downcase
          if categoryLink == ".net"
            categoryLink = categoryLink.slice(1, categoryLink.size - 1)
          end

          postData = Hash.new
          postData['authorName'] = author['name']
          postData['authorSite'] = author['website']
          postData['category'] = postRawData['category']
          postData['categoryLink'] = categoryLink
          postData['title'] = postRawData['title']
          postData['excerpt'] = postRawData['excerpt']
          postData['created'] = postRawData['created']
          postData['postUrl'] = getPostUrl(postRawData['title'], context)
          postData['day'] = Time.at(postRawData['created']).mday
          postData['month'] = Time.at(postRawData['created']).strftime("%b.  %Y")
          
          layoutData.push(postData)

        end
       template = File.read(File.join(site['source'], '_includes', 'postShort.html'))
       output << Liquid::Template.parse(template).render('data' => layoutData)        
      end        
    end
  end

  class ClientsTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text   = text
      @tokens = tokens
    end

    def render(context)
      site = context.environments.first["site"]

      clients = []
      # Get clients model
      Dir.foreach("_clients") do |fname|
        next if fname == "." or fname == ".."

        data = YAML.load(File.read(File.join(site['source'], '_clients', fname)))
        clients.push(data)
      
      end

      layoutData = []

      "".tap do |output|
        (0..4).each do |i|
            idx = rand(clients.length)
            client = clients[idx]
            clients = clients - [client]
            layoutData.push(client)
        end

        template = File.read(File.join(site['source'], '_includes', 'clients.html'))
        output << Liquid::Template.parse(template).render('data' => layoutData)        
      end

    end
  end

  class TestimonialsTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text   = text
      @tokens = tokens
    end

    def render(context)
      site = context.environments.first["site"]
      page = context.environments.first["page"]

      if page['layout'] == 'careers'
        folder = '_team'
      else
        folder = '_clients'
      end

      clients = []
      # Get clients model
      Dir.foreach(folder) do |fname|
        next if fname == "." or fname == ".."

        data = YAML.load(File.read(File.join(site['source'], folder, fname)))
        clients.push(data)
      
      end

      layoutData = []

      "".tap do |output|
        (0..2).each do |i|
          # this does not consider highlighted property.
          # should modify to run until 3 highlighted are selected (or the list empties).
            idx = rand(clients.length)
            client = clients[idx]
            clients = clients - [client]
            layoutData.push(client)
        end

        template = File.read(File.join(site['source'], '_includes', 'testimonials.html'))
        output << Liquid::Template.parse(template).render('data' => layoutData)        
      end

    end
  end


end



Liquid::Template.register_tag('authors', Jekyll::AuthorsTag)
Liquid::Template.register_tag('experts', Jekyll::ExpertsTag)
Liquid::Template.register_tag('postExcerpt', Jekyll::PostExcerptTag)
Liquid::Template.register_tag('clients', Jekyll::ClientsTag)
Liquid::Template.register_tag('testimonials', Jekyll::TestimonialsTag)