---
title: "IHCON 2002 Abstract: Hearing Aid Fitting with a Genetic Algorithm"
---

by Eric Durant, Greg Wakefield, Dianne VanTasell, and Martin Rickert

International Hearing Aid Research Conference (IHCON) 2002

Wednesday-Sunday 21-25 August 2002

The signal processing parameters of today's complex hearing aids are usually set via prescriptive fitting algorithms accessible through the hearing aid manufacturer's fitting software. Once the initial setting of the parameters has been accomplished, however, there is usually a second phase wherein the parameters must be further adjusted to approximate more closely the user's preferred settings as the user becomes accustomed to wearing the hearing aid. Because there are so many adjustable signal processing parameters, and because their effects co-vary, the simultaneous readjustment of all necessary parameters is a complex multidimensional task that is, at best, tedious, error-prone, and time-consuming. An automated, efficient, and effective means for searching a multidimensional hearing aid parameter space is therefore required.

Research on parameter search procedures for fitting hearing aids has typically used mathematical optimization theory, adapting search approaches such as the simplex method (Neuman <em>et al.</em>, 1987). As the number and complexity of hearing aid parameters increase, the shortcomings of these methods, such as becoming stuck at local optima and not being able to combine attributes from multiple settings, become burdensome. The genetic algorithm (GA) is a search procedure that borrows many concepts from biology, including natural selection and genetic crossover and mutation. The GA maintains a population of solutions (hearing aid parameter sets) and repeatedly replaces the least fit solutions with the offspring of better performing solutions. In the work reported here, the GA was applied to hearing aid fitting via development of an efficient procedure to determine the relative quality of solutions in the population by repeatedly asking the patient to select the better of two alternatives.

Two experiments were conducted with eight normal hearing and eight hearing-impaired subjects. In the first, three parameters were varied to control a normalized least mean squares (NLMS) filter for cancellation of acoustic feedback. In the second, six parameters were varied to fit slow-acting three-band dynamic range expansion. In both experiments, the GA was running in a portable experimental hearing aid platform that was configured to enable subjects to make paired comparisons of hearing aid parameter sets in their normal acoustic environments.

In the feedback cancellation experiment, all subjects converged efficiently to parameter sets that produced optimal feedback cancellation. A follow-up experiment showed that subjects' initial preferences varied little upon retesting. The results for the expansion system were also positive, but highlighted some problems and suggested changes that might be made to improve performance when fitting more complicated parameter sets.
