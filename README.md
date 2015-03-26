# coreNLP
To download the R library and coorisponding CoreNLP java library, 
run the following in R:
```{r}
devtools::install_github("statsmaths/coreNLP")
download.file("http://nlp.stanford.edu/software/stanford-corenlp-full-2015-01-29.zip")
unzip("stanford-corenlp-full-2015-01-29.zip")
```
Then, in order to run the package, the following code initializes
rJava correctly (if run from the same directory as the above):
```{r}
library(coreNLP)
initCoreNLP("stanford-corenlp-full-2015-01-29")
```
As a simple example of usage, this how to annotate the opening lines
to "The Cat in the Hat":
```{r}
catInHat = c("the sun did not shine.", "it was too wet to play.",
             "so we sat in the house all that cold, cold, wet day.")
output = annotateString(catInHat)
```
Which gives the following information via `getToken`, `getDependency`
and `getSentiment`:
```{r}
> getToken(output)[,c(1:3,6:7)]
   sentence  word lemma POS      NER
1         1   the   the  DT        O
2         1   sun   sun  NN        O
3         1   did    do VBD        O
4         1   not   not  RB        O
5         1 shine shine  VB        O
6         1     .     .   .        O
7         2    it    it PRP        O
8         2   was    be VBD        O
9         2   too   too  RB        O
10        2   wet   wet  JJ        O
11        2    to    to  TO        O
12        2  play  play  VB        O
13        2     .     .   .        O
14        3    so    so  IN        O
15        3    we    we PRP        O
16        3   sat   sit VBD        O
17        3    in    in  IN        O
18        3   the   the  DT        O
19        3 house house  NN        O
20        3   all   all  DT        O
21        3  that  that  DT        O
22        3  cold  cold  JJ        O
23        3     ,     ,   ,        O
24        3  cold  cold  JJ        O
25        3     ,     ,   ,        O
26        3   wet   wet  JJ        O
27        3   day   day  NN DURATION
28        3     .     .   .        O
> getDependency(output)
   sentence governor dependent   type governorIdx dependentIdx
1         1     ROOT     shine   root           0            5
2         1      sun       the    det           2            1
3         1    shine       sun  nsubj           5            2
4         1    shine       did    aux           5            3
5         1    shine       not    neg           5            4
6         2     ROOT       wet   root           0            4
7         2      wet        it  nsubj           4            1
8         2      wet       was    cop           4            2
9         2      wet       too advmod           4            3
10        2     play        to    aux           6            5
11        2      wet      play  xcomp           4            6
12        3     ROOT       sat   root           0            3
13        3      sat        so    dep           3            1
14        3      sat        we  nsubj           3            2
15        3      sat        in   prep           3            4
16        3    house       the    det           6            5
17        3       in     house   pobj           4            6
18        3      sat       all   tmod           3            7
19        3      day      that    det          14            8
20        3      day      cold   amod          14            9
21        3      day      cold   amod          14           11
22        3      day       wet   amod          14           13
23        3      all       day    dep           7           14
> getSentiment(output)
  id sentimentValue sentiment
1  1              1  Negative
2  2              1  Negative
3  3              1  Negative
```
