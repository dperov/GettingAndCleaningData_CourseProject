Getting and Cleaning Data Course Project
====================

The purpose of this project is to to collect, work with, and clean a data set from Human Activity Recognition database (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 


The goal is to prepare a tidy dataset that can be used for later analysis. 

###Reposiotry contains of the following files:

* run_analysis.R

This script performs processing of the data from Human Activity Recognition database and produce a resulted tidy dataset.

Script runs unattendedly. It downloads data from internet and then preprocessed it. Result is written to the file **result_aggregated.txt** in the current directory. See R code comments for the details of data processing.

* Codebook.md

Markdown file describing  the fields in the processed dataset

* README.md

This file

* result_aggregated.txt

Preprocessed dataset in R read.table() format

Resources
=============================

* [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
