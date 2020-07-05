---
layout: post
title:  "Deep Learning with Fast AI: Lesson 1"
date:   2020-07-02 06:00:00 -0700
category: dev
tags: deeplearning fastai ml
---

I felt inspired to play with some deep learning tools lately, and remembered that [fast.ai](https://www.fast.ai) has been
on my todo list for a while. What follows will be a series of posts chronicling my experimentation with the framework. I'll
note that I have very little prior knowledge of machine learning, so you'll be seeing this course through the eyes of beginner,
and the focus will be on providing a flavor for the course without being comprehensive. Your highly encouraged to take the
course if you want to dive deeper. 

The first stop is the [main course website](https://course.fast.ai/index.html) where you'll learn a little about the hardware and
software involved in running the models. They have a nice introductory section on terminal usage, GPUs, and cloud provider
setup. Ultimately though, you'll be running their [fast.ai](https://docs.fast.ai/index.html) library (which itself is a 
python library utilizing [PyTorch](https://pytorch.org)) from the comfort of a [jupyter](https://jupyter.org) notebook
running on a GPU from the cloud provider of your choosing (I went with [Google Cloud Platform](https://cloud.google.com) 
since I have prior experience with [Amazon Web Services](https://aws.amazon.com) and wanted to try something new).

Once your environment setup is complete, you'll jump into the [first lesson](https://course.fast.ai/videos/?lesson=1) 
which involves the training of an image classifier. One aspect of the fast ai approach to teaching this topic that
I truly enjoy is the concept of "playing the whole game". What this means is that you'll learn how to use the tools
to solve a complete problem first (like how to classify images), even if you don't understand all of the underlying concepts
(like what a convolutional neural network is), and progressively dive into a deeper and deeper understanding as your interests and needs
guide you. This concept comes from a [set of principles](https://www.gse.harvard.edu/news/uk/09/01/education-bat-seven-principles-educators)
by Professor David Perkins from the Harvard Graduate School of Education. 
His thinking is that, "You don't learn to play baseball by a year of batting practice", so why don't we apply this same concept
to other areas of study? You'll receive a brief introduction to this teaching philosophy, an in-depth walkthrough
of the first lesson's jupiter notebook, a presentation of some interesting usages of deep learning, and some inspiring fast ai alumni
stories in the lecture. Then you are off on your own to learn how to classify images using fast ai.

Consistent with their educational philosophy, one of the very first lines in the notebook involves configuring a batch size,
but they don't explain what that is exactly -- the primary focus is to get the classifier working as soon as possible (to 
"play the whole game"). They then link to a [dataset](http://www.robots.ox.ac.uk/~vgg/data/pets/) involving different cat 
and dog breeds, and introduce you to your first model: [resnet34](https://arxiv.org/pdf/1512.03385.pdf). At this point I
want to mention that already there have been five or six quality links in the course that would take hours to peruse and understand, 
but as they suggest, I'm pressing on without reading through these links, and instead will revisit them on a second pass through the material. 
For now, I can see that this model will take some images as input, and output the predicted probability for each of the animal breeds, and that's good
enough for now.

After running the model on our input dataset we see some output, including an error rate. Behind the scenes, fast ai took our
dataset and split it into some data for training, testing, and validation. When we run the model, it outputs the error rate against
the validation set, so we know how accurate our model is against data it has never seen. Any data used to train a model is tainted
in the sense that the model now knows what this data looks like, and will be better at making predictions about it. If I train a model
against the same dataset over and over, it will become very good at identifying the images in that dataset (since I'm telling it that this
image maps to this animal breed), but it may not be good in the general sense. If provided with an image it has never seen before, it 
may fail. This is called overfitting your model to the training dataset, and this is why we split some of the data into a validation set.

On the first run, the error rate was 0.062, which means the model correctly identified the images in roughly 94% of the cases. That's a great result! Additionally, we manually look at some of the 
cases that the model was most confused about to determine if those mistakes were reasonable. In this case, they do seem like 
reasonable mistakes, and plotting the confusion matrix shows that certain categories are confused over and over. We then adjust 
the learning rate on the model, and observe the results (which have actually not changed much, at an error rate of 0.064). 
To improve our results, we instead use the resnet50 model. The '34' and '50' after the 'resnet' model name is the number 
of layers in the model. I don't know what that means at this point, but apparently more layers can result in better 
performance (so says the course notebook, and promises we'll learn more later, so that's good enough for me). Running 
this model yields an error rate of 0.048, which is an improvement over the resnet34 result. Fine tuning the model
further and running it yields an error rate of 0.05, so it doesn't seem to be an improvement and we revert back to the previous 
configuration.

So to recap, in lesson one we trained an image classifier to identify different dog and cat breeds to roughly 95% accuracy. We
know we are somehow doing that with a convolutional neural network, which consists of layers, and that we can tune things
like batch sizes, epochs, and learning rates, but we don't know much about what these things mean. But even without knowing, 
it should be possible to use this framework to classify images of other types. Neat!