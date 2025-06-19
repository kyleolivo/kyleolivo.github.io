---
title: "FastAI: Philosophy and The First Model"
date: [2024-03-02]
---

This post is about [Practical Deep Learning for Coders](https://course.fast.ai/Lessons/lesson1.html).

I'm working my way through the course [Practical Deep Learning for Coders](https://course.fast.ai), which uses FastAI, 
a library for quickly iterating on Deep Learning related problems. You may be wondering why I'm focusing on this material rather 
than the latest and greatest advancements in this field, like LLMs. Ultimately, I see my knowledge in the AI/ML space as a gap that 
I need to fill, and gaining a broad exposure to a few different areas will be beneficial. Several years ago, Andrew Ng claimed that 
[AI is the new electricity](https://www.gsb.stanford.edu/insights/andrew-ng-why-ai-new-electricity), and I believe
he's right. And while the best time to have jumped into this area would have been years ago, the next best time is now.
As for this course over LLMs or some other resource, we've seen time and again that once the hype fades on any particular 
technology, the fundamentals always remain. FastAI seems to strike a nice balance between giving you the right exposure and not 
overwhelming you with too many details up front. It's an approach that academics in the education field have called 
["Playing the Whole Game"](https://inquiry.galileo.org/ch1/playing-the-whole-game/), and it's a philosophy that really
resonates with me.

The [first lesson](https://course.fast.ai/Lessons/lesson1.html) is an overview to this area of computation, along with a 
practical first model that gets you "Playing the Whole Game" right away by classifying some images to determine if a bird
is present in a series of forest photos. The fact that we can solve problems like this today is amazing, and the field
has made a lot of progress since that lecture was posted. Now we have the early forms of AI assistants with tools like
[ChatGPT](https://chat.openai.com/auth/login), [DALL-E](https://openai.com/dall-e-2) to generate novel images for us,
and just recently [Sora](https://openai.com/sora) has the ability to generate video from text. I really believe we're
still in Day 1 of this journey, and it's really exciting!

The lesson continues by talking about [ethics](https://ethics.fast.ai), sharing student experiences, and then walks you 
through the usage of notebooks to implement the first model in FastAI. Another interesting detail I learned was that most 
of the documentation shared by FastAI is actually just views of [Jupyter notebooks](https://jupyter.org), so I might 
consider implementing that as part of my workflow eventually. Finally, I used the model from the lesson to [modify the 
classifier](https://www.kaggle.com/kyleolivo/image-classifier) so that it could identify between two different types of similar trees, the 
[sweetgum](https://duckduckgo.com/?q=sweetgum+tree) and [maple](https://duckduckgo.com/?q=maple+tree) trees.

I'll add a final thought here which was around some of the challenges I've faced starting this course. First, I've been
playing the engineering manager role for a while now, so the amount of coding I've been doing has been limited. Additionally,
most of the serious development I've done has been in Java, so reacquainting myself with the Python ecosystem has been fun.
While diving back into coding and experiencing the sense of flow that comes with that doesn't fall in the category of challenges,
what has been challenging is avoiding the temptation to dive deep into several different areas, like language or library details. 
As anyone who has ever visited a wikipedia page can attest, the temptation to branch out and dive deep into several tangential 
areas as you are learning in a new area is strong. I've had to actively pull myself back to focus on "Playing the Whole Game" 
several times. The right balance between breadth and depth will always depend on the task at hand, and I'll have to see what 
sort of balance I strike as I continue making progress in this area.
