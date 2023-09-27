---
title: "CSC4651/5651 Deep Learning In Signal Processing: Vanishing Gradients Lab"
---

Please work through the MATLAB example "Detect Vanishing Gradients in Deep Neural Networks by Plotting Gradient Distributions" at https://www.mathworks.com/help/deeplearning/ug/detect-vanishing-gradients-in-deep-neural-networks.html

If you have questions, feel free to post them to the Course Q&A so we can discuss them as a class. You're welcome to send me questions directly and I will post them to the Q&A if I think others may be interested in the answers.

In this lab, you'll use the MATLAB Live Editor to contain your code, result graphs, and discussion. When you are finished, go to the LIVE EDITOR tab, and select Export | Export to PDF... from the FILE area. I recommend using the Files webapp from your [Rosie dashboard](https://dh-ood.hpc.msoe.edu/pun/sys/dashboard/) to download your PDF to your local computer.

I recommend you click "Copy Command" and then right-click to paste that command into your MATLAB desktop window running on Rosie. This will save you the work of typing the code; the MATLAB Live Editor will open, which allows you to easily re-run and edit sections of code. If the equations don't render on Rosie (you may see red diamonds with '?' instead), you'll need to view the webpage above outside of MATLAB to see the equations.

The "Run Section" and "Run and Advance" commands in the SECTION area of the LIVE EDITOR tab are very useful since it lets you run just the current block of code, and re-run it if desired. If you don't see these buttons in the LIVE EDITOR area at the top of the window, you can either select the downward pointing triangle in the SECTION area or make your window larger.

As you run lines of code, note how the variables displayed in the Workspace pane update. By default, the Workspace pane is displayed at the lower left of the MATLAB window. This can be controlled by going to the Home tab and clicking on the Layout button in the Environment group.

You can double-click an item in the Workspace pane to browse and edit its values.

Notice that when you run a section, a dark blue highlight appears to the left of each line of code as it is processed. This is useful when you have longer running commands, such as `digitTrain4DArrayData` which is used to load the dataset used in this example. Also note that the lower left of the MATLAB window indicates Busy while it is processing commands.

When you get to the end of the part of the Train Models section that shows in the Live Editor, you'll need to return to the original webpage to view the rest of the example.

If you haven't already, you should save your Live Script. Go to the Live Editor Tab, click the triangle below the Save button, and select Save As… Click the Home button, optionally select or create a subdirectory for your work, give the file a shorter name (such as vanishingGradients.mlx), and click Save.

Notice that the working directory in MATLAB, shown just below the button bar, or accessible with the pwd function from the Command Window, is still the long directory where the original example was stored. Click on your username after /home, and then double-click on the directory you selected above to store your code for this lab, which is located in the Current Folder area near the upper left of the MATLAB window.

Note that there are 6 functions shown in the Supporting Functions section. You're going to copy these into .m files to they can be accessed by your Live Script. Click New | Script. Then copy the text of the 5-line modelLoss function from the webpage, right-click in the 'untitled' script, and select Paste. Click the Save button. Note that you're in the directory you selected above for this lab since you set it was the working directory in the previous step (if you didn't, you'll need to navigate that directory now). Note that the proper filename, modelLoss.m, is already filled in for you based on the pasted code. Click Save.

Repeat this process for the remaining 5 scripts. Be sure to read about what each script does. You don't need to understand every function at this point, but you may wish to look some up in the MATLAB documentation. For example, type doc histcounts to learn more about what that function is doing inside the gradient Distributions function.

Now, return to the Live Editor Tab, go to the end of the script, and click the Section Break button to create a section for your additional code. Paste the next section of code, select Run Section (or Run and Advance), and continue through the example.

The model training and generation of gradient distribution graphs will take about 3 minutes on a Rosie Compute Node using. Note that gradients are much closer to 0 for the [Sigmoid activations](https://www.mathworks.com/help/deeplearning/ref/dlarray.sigmoid.html) than the [ReLU activations](https://www.mathworks.com/help/deeplearning/ref/dlarray.relu.html).

## Questions
1. Can you explain the significance of vanishing and exploding gradients in the context of neural networks? How do they affect the training process?
1. How did the variables in the Workspace pane change as you progressed through the code? Were there any variables that caught your attention? Why?
1. For the final graph showing average gradient at each layer for the 2 different activation types, note how the gradients at the 4th layer are increasing over iteration number for the ReLU activation. Why might this be? Hints:
   * Consider what the loss graph is telling you.
   * When the gradient magnitude is large, it means a small change in input (or weight) is causing a large change in output.

## Requirements
Your submission should span approximately three double-spaced pages and can be uploaded to Canvas as a Word document, PDF, or Google doc.

* Your submission can be uploaded via Canvas as a Video, PDF of a MATLAB Live Script, Word document, Google doc, etc.
