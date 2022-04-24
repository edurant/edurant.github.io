# Term Project—Milestone 4: Presentation Draft

This page describes the fourth of six project milestones and is due at the end of week 7.

You are encouraged to discuss these items with the professor and other students as you are working on this assignment. I am glad to help you with ideas on any parts that you're finding especially challenging.

## Overview

Your presentation should have three key methods of conveying information.
1. Slides including illustrations. Sometimes these stand on their own (thus making the slides useful for documenting project status), but they don't have to.
1. Demonstration. Show specific results. Focus on strengths and limitations. In some cases, a live demo is helpful, but often showing and discussing results works well.
1. What you plan to say. Your goal is to guide the audience through your thought process and explain your results.

Your audience is the other students in the class, that is, a technically competent audience that has a mix of backgrounds in signal processing and deep learning.

## Deliverables

The main deliverable is a draft of your slides including a first draft of / notes on your demonstration. They should be nearing completion, but will change as you finish your work.

You might also include notes on what you plan to say if it would help a reviewer understand how you're going to use your slides. Sometimes this is fairly obvious and does not need to be included; it depends on your presentation style.

## Content

The title slide should include your names, the class and project name, and the date the presentation is given. In addition to setting the context for your audience, these details are useful when presentation slides or videos are referenced by colleagues later.

Then, give a high-level statement of the problem you solved and briefly describe the quality/type of your results (Were you successful? Did you end up solving a slightly different problem? Did you learn some methods that wouldn't work and clarify the challenges, especially if you did not achieve successful results?).

Then, you should describe your general approach to the problem, drawing on your references and research.

After that, you will want to include most of the following, although you should consider what order will be most effective. In some cases, presenting results first and then showing how you got them is clearest. Other times, going through the work in linear order, ending with results and analysis, makes the most sense:
* Network structure, any variations tried, did they improve or worsen performance? This can be adapted from your work on the previous milestone.
* Data sources, any preparation/preprocessing, challenges. Again, this can be adapted from your work on the previous milestone.
* How successful was training, were many attempts needed, were different algorithms tried, how long did it take, did you use 1 GPU on one of Rosie's T4 servers, or something else?
* Performance metrics appropriate to your problem
  * For classification: accuracy-precision curve, precision-recall curve, and/or confusion matrix
  * For regression: MSE, perceptual, or other metric; often as a function of key independent variables in the problem space (loudness, noise level, gender/age of speaker)
