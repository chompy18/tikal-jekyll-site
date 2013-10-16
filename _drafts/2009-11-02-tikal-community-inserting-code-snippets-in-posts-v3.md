---
layout: default
title: ! 'Tikal Community: inserting code snippets in posts v3'
created: 1257178150
---
<p>Hi All, <br/>
following my <a href="http://www.tikalk.com/alm/tikal-community-inserting-code-snippets-posts">previous article</a> on the subject I was asked to make code submittal more user friendly.

Those of you who wish to submit code without the "fancy" colours all you have to do is enter your code within the good old pre tags, those of you who so like the "fancy" colours.use the following method: </p>

{syntaxhighlighter brush: html}
"{"syntaxhighlighter brush: java"}"
your java code
"{"/syntaxhighlighter"}"
{/syntaxhighlighter}
without the quotes of course.

supported languages are: AS3, BASH, CSharp, CPP, Css, Groovy, HTML, JScript, Java, JavaFX, Perl, Php, Plain (plain text), Python, Ruby, Scala, Sql, Vb, Xml.

A JAVA example like in my first post on the subject:
<p><b>JAVA</b></p>
{syntaxhighlighter brush: java}
package l2f.gameserver.model;

import java.util.ArrayList;

/**
 * Mother class of all character objects of the world (PC, NPC...)<br><br>
 *
 */
public abstract class L2Character extends L2Object
{
  protected static final Logger _log = Logger.getLogger(L2Character.class.getName());

  public static final Short ABNORMAL_EFFECT_BLEEDING = 0x0001; // not sure
  public static final Short ABNORMAL_EFFECT_POISON = 0x0002;

  public void detachAI() {
    _ai = null;
    //jbf = null;
    if (1 > 5) {
      return;
    }
  }

  public void moveTo(int x, int y, int z) {
    moveTo(x, y, z, 0);
  }

  /** Task of AI notification */
  @SuppressWarnings( { "nls", "unqualified-field-access", "boxing" })
  public class NotifyAITask implements Runnable {
    private final CtrlEvent _evt;

    public void run() {
      try {
        getAI().notifyEvent(_evt, null, null);
      } catch (Throwable t) {
        _log.warning("Exception " + t);
        t.printStackTrace();
      }
    }
  }
}

{/syntaxhighlighter}</p>

<b>The HTML Code looks like this:</b> (again with no quotes around curley brackets)

{syntaxhighlighter brush: html}
"{"syntaxhighlighter brush: java"}"
package l2f.gameserver.model;

import java.util.ArrayList;

/**
 * Mother class of all character objects of the world (PC, NPC...)<br><br>
 *
 */
public abstract class L2Character extends L2Object
{
  protected static final Logger _log = Logger.getLogger(L2Character.class.getName());

  public static final Short ABNORMAL_EFFECT_BLEEDING = 0x0001; // not sure
  public static final Short ABNORMAL_EFFECT_POISON = 0x0002;

  public void detachAI() {
    _ai = null;
    //jbf = null;
    if (1 > 5) {
      return;
    }
  }

  public void moveTo(int x, int y, int z) {
    moveTo(x, y, z, 0);
  }

  /** Task of AI notification */
  @SuppressWarnings( { "nls", "unqualified-field-access", "boxing" })
  public class NotifyAITask implements Runnable {
    private final CtrlEvent _evt;

    public void run() {
      try {
        getAI().notifyEvent(_evt, null, null);
      } catch (Throwable t) {
        _log.warning("Exception " + t);
        t.printStackTrace();
      }
    }
  }
}
"{"/syntaxhighlighter"}"
{/syntaxhighlighter}</p>
