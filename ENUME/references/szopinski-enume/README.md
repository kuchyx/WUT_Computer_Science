# szopinski-enume

My implementation of the ENUME project for Dr Marusak. This repository serves to document my journey in passing EiTI's most difficult subject and to aid the later generations in achieving the same. Young engineer, be aware that your legacy is built upon the sacrifice of those who perished here.

## Running the MATLAB scripts

Set `projX` as your working directory in MATLAB and type in the names of the scripts starting with `task`. This will generate text output in the command window as well as 2D plot figures. The figures will also be printed as PDFs in the `report` subdirectory, to be included in the project report.

## Compiling the reports

The reports are written in LaTeX. Navigate to `projX/report` (make sure it's your working directory) and execute the following command:

```
pdflatex projXreport.tex
```

Running the MATLAB scripts beforehand is required for figures to be included.
