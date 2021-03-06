% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotMotionSingleFrame.R
\name{plotMotionSingleFrame}
\alias{plotMotionSingleFrame}
\title{Plot a single frame of 3D motion data}
\usage{
plotMotionSingleFrame(xyzList, childs, frame, lims, rotateAngle = 0,
  viewAngle = 40, mainTitle = frame, ...)
}
\arguments{
\item{xyzList}{a list of \code{xyz} objects such as obtained with \code{getMotionData()}
Each \code{xyz} object depicts the motion of a single skeleton}

\item{childs}{the \code{childs} list of a \code{asf} object obtained with \code{readASF()}}

\item{frame}{a frame number (currently unvalidated!)}

\item{lims}{a list of limits for the x, y, z axes.
Format: list(limX = c(min, max), limY = c(min, max), limZ = c(min, max))}

\item{rotateAngle}{angle in degrees to rotate the entire skeleton around the
Y (upwards) axis, defaults to 0}

\item{viewAngle}{the \code{scatterplot3d}'s \code{angle} parameter, defaults to 40}

\item{mainTitle}{the \code{scatterplot3d}'s \code{main} title parameter,
defaults o frame number}

\item{...}{additional arguments to the \code{scatterplot3d} function}
}
\description{
Plot a single 3D frame of the \code{xyz} data obtained with \code{getMotionData()}.
The plot used is a \code{scatterplot3d} plot.
}
\examples{
asfFilePath <- system.file("extdata", "lambada.asf", package = "mocap")
asf <- readASF(asfFilePath)
amcFilePath <- system.file("extdata", "lambada.amc", package = "mocap")
amc <- readAMC(amcFilePath, asf)
xyz <- getMotionData(asf, amc)
limX <- c(min(unlist(lapply(xyz, function(x) min(x[, 1])))),
  max(unlist(lapply(xyz, function(x) max(x[, 1])))))
limY <- c(min(unlist(lapply(xyz, function(x) min(x[, 2])))),
  max(unlist(lapply(xyz, function(x) max(x[, 2])))))
limZ <- c(min(unlist(lapply(xyz, function(x) min(x[, 3])))),
  max(unlist(lapply(xyz, function(x) max(x[, 3])))))
lims <- list(limX = limX, limY = limY, limZ = limZ)
plotMotionSingleFrame(list(xyz), asf$childs, 1, lims)

}
\references{
A blog post describing the package with more examples: \url{http://giorasimchoni.com/2017/08/08/2017-08-08-lambada-the-mocap-package/}

The CMU Graphics Lab Motion Capture Database: \url{http://mocap.cs.cmu.edu/}
}
