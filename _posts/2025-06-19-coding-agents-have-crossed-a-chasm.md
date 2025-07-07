---
title: "Quote: Coding agents have crossed a chasm"
excerpt_separator: "<!--more-->"
tags:
  - quotes
---

> This points to something bigger: there’s an emerging art to getting the right state into the context window. It’s sometimes not enough to just dump code at these models and ask “what’s wrong?” (though that works surprisingly often). When stuck, you need to help them build the same mental framework you’d give to a human colleague. The sequence diagram was essentially me teaching Claude how to think about our OAuth flow. In another recent session, I was trying to fix a frontend problem (some content wouldn’t scroll) and couldn’t figure out where I was missing the correct CSS incantation. Cursor’s Agent mode couldn’t spot it either. I used Chrome dev tools to copy the entire rendered HTML DOM out of the browser, put that in the chat with Claude, and it immediately pinpointed exactly where I was missing an overflow: scroll.
> 
> 45 minutes of manual debugging → 2 minutes with the right reasoning context.
> 
> For complex problems, the bottleneck isn’t the AI’s capability to spot issues - it’s our ability to frame the problem in a way that enables their reasoning. This feels like a fundamentally new skill we’re all learning.

[Full article](https://blog.singleton.io/posts/2025-06-14-coding-agents-cross-a-chasm/)
