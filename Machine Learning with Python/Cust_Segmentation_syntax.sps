* Encoding: UTF-8.


get file = "c:\Users\jan.petr\OneDrive - Ipsos\Provozni\coursera\IBM-Data-Science-Professional-Certificate\Machine Learning with Python\Cust_Segmentation_toSPSS.sav".

DATASET DECLARE  newData.
QUICK CLUSTER Age Edu Years_Employed Income Card_Debt Other_Debt Defaulted DebtIncomeRatio
  /MISSING=LISTWISE
  /CRITERIA=CLUSTER(3) MXITER(12) CONVERGE(0)
  /METHOD=KMEANS(NOUPDATE)
  /PRINT INITIAL ANOVA CLUSTER DISTAN
  /OUTFILE=newData.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Edu Age Income Cluster MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Edu=col(source(s), name("Edu"))
  DATA: Age=col(source(s), name("Age"))
  DATA: Income=col(source(s), name("Income"))
  DATA: Cluster=col(source(s), name("Cluster"), unit.category())
  COORD: rect(dim(1,2,3))
  GUIDE: axis(dim(1), label("Income"))
  GUIDE: axis(dim(2), label("Edu"))
  GUIDE: axis(dim(3), label("Age"))
  GUIDE: legend(aesthetic(aesthetic.color.exterior), label("Cluster"))
  ELEMENT: point(position(Income*Edu*Age), color.exterior(Cluster))
END GPL.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Edu Income Age Cluster MISSING=LISTWISE 
    REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: Edu=col(source(s), name("Edu"))
  DATA: Income=col(source(s), name("Income"))
  DATA: Age=col(source(s), name("Age"))
  DATA: Cluster=col(source(s), name("Cluster"), unit.category())
  COORD: rect(dim(1,2,3))
  GUIDE: axis(dim(1), label("Age"))
  GUIDE: axis(dim(2), label("Edu"))
  GUIDE: axis(dim(3), label("Income"))
  GUIDE: legend(aesthetic(aesthetic.color.exterior), label("Cluster"))
  ELEMENT: point(position(Age*Edu*Income), color.exterior(Cluster))
END GPL.
