---
title: "Dr. Durant: CS-4981 Deep Learning in Signal Processing"
---

* Majors: BME (see note below), CE, CS, and SE
* Prerequisites: MA383 and (CS2040 or CS3210)
* Structure: 2-2-3

## Overview

This elective course provides an overview of deep learning methods and models as used in digital signal processing (DSP), including key DSP concepts that appear in and adjacent to such models in both real-time and off-line applications. Key topics include training pipelines, convolutional layers of various dimensions used on both time series and time-frequency representations of data, common network architectures, mitigation of overfitting, error metrics, and performance evaluation. Topics of student interest will be addressed by special lecture topics and course projects.

This is a new, special-topics elective being offered for the first time in spring, 2022.

## BMEs

BMEs who want to take the course must have completed BE2200 and EE3221. The professor is willing to recommend a prerequisite waiver for these students, but final approval lies at the department level. Students may register without meeting the prerequisites, but may receive notice that they will be removed during week 1 if they have not resolved prerequisite issues.

## Toolset

Rosie is MSOE's high performance supercomputer, which we will be using in this class. Please find the user's guide including instructions on requesting an account [here](https://msoe.dev/).

We will use MATLAB's Deep Learning Toolbox running on Rosie for this class. The course does not assume knowledge of MATLAB or Python, etc.

## MATLAB Deep Learning Toolbox on Rosie

### Recommended Method

1. [Launch interactive desktop on compute node using VNC.](https://dh-ood.hpc.msoe.edu/pun/sys/dashboard/batch_connect/sys/rosie_vnc_desktop/session_contexts/new)
1. Select 1 GPU and the number of hours you need.
1. Open a terminal window on the remote desktop. You can do this by clicking the footprint icon in the upper left and searching for "term." Select "MATE Terminal."
1. See procedure below to get a license file for MATLAB.
1. `singularity exec --nv ~durant/matlab-r2021b.sif bash` (Temporary location until the Singularity image file is installed in a system location)
1. `matlab&`
   * If you receive an error that the license for a different computer is installed, `/opt/matlab/R2021b/bin/activate_matlab.sh` to manually start the activation process, which will allow you to select a different license file.
1. Chose "Activate manually without the Internet", "Next", "Enter the full path...", "Browse" and then point MATLAB to the license file you downloaded from MathWorks and uploaded to Rosie. The activation GUI will disappear without reporting an error when you've successfully activated.
1. `matlab&`
1. The MATLAB GUI appears and you have access to:
   * [Deep Learning Toolbox](https://www.mathworks.com/help/deeplearning/getting-started-with-deep-learning-toolbox.html)
   * Signal Processing Toolbox
   * Statistics and Machine Learning Toolbox
   * Image Processing Toolbox
   * and much more

### Alternate Method (Not Fully Tested)

This method is incomplete; a method for forwarding the GUI (e.g., tunneling VNC) has not yet been documented.

1. ssh into a Rosie management node
1. `srun --partition=teaching --gres=gpu:t4:1 singularity exec --nv ~durant/matlab-r2021b.sif bash`
1. `matlab&`

### Get MATLAB License File

Once you know which node you're on, you need to generate a MATLAB license file (unless you previously generated one for this particular node).

You should complete these steps directly on your laptop using Chrome. This does not need to be done on Rosie.

These instructions are adapted from [this MathWorks Central post](https://www.mathworks.com/matlabcentral/answers/235126-how-do-i-generate-a-matlab-license-file#answer_190013).

1. Go to the License Center: https://www.mathworks.com/licensecenter/licenses
1. Log into (or create) your MathWorks Account if you are not already logged in
1. Select your license number from the list. If you don't see your license, use the links in the upper left hand corner to toggle between Licenses, Trials, and Prereleases
1. Select the "Install and Activate" tab
1. Click the "Activate to Retrieve License File" link under "Related Tasks" on the right side of the page.
1. On the page titled "Activated Computers," click the blue "Activate a Computer" button on the right side of the page.
1. Enter the required information to complete activation. Release = R2021b, Operating System = Linux
1. For the Host ID, enter the MAC address of your assigned node. `/sbin/ifconfig eth0` on your assigned Rosie node. Copy the 6-byte address that shows up after `ether`
1. For the Computer Login Name, enter your MSOE username (e.g., doej)
1. For the Activation Label, make it correspond your node number, e.g., "Rosie dh-nodeNN" to aid in finding it later
1. Select "Yes" when asked "Is the software installed?"
1. MathWorks will verify your MSOE account through MSOE SSO. This sometimes generates an error message when attempting to open the SSO URL. If this happens, copy the entire (very long) URL from the error message and open it in a new tab. You should be told that verification was successful (you may need to enter your MSOE username and password if not already authenticated). At this point, you should be able to go back to the MathWorks window and finish downloading your license file.
1. Download the license file. Recommended naming convention: license-username-node.lic, e.g., license-durant-dh-node18.lic
1. Upload to Rosie. Recommended method is selecting Files, Home Directory from your [Rosie Dashboard](https://dh-ood.hpc.msoe.edu/pun/sys/dashboard), but you could also use a SecureFTP program connected to one of the management nodes.