#example for slides 2&3

#use fastQC
/00_untrimmed_fastq$ fastqc *.fastq.gz 

#unzip the resulting files

/00_untrimmed_fastq$ unzip S5295Nr1.1_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr1.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr2.1_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr2.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr3.1_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr3.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr4.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr4.1_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr5.1_fastqc.zip
 
/00_untrimmed_fastq$ unzip S5295Nr5.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr6.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr6.1_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr7.1_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr7.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr8.2_fastqc.zip

/00_untrimmed_fastq$ unzip S5295Nr8.1_fastqc.zip




/00_untrimmed_fastq$ ls
S5295Nr1.1_fastqc       S5295Nr2.1_fastqc       S5295Nr3.1_fastqc       S5295Nr4.1_fastqc       S5295Nr5.1_fastqc       S5295Nr6.1_fastqc       S5295Nr7.1_fastqc       S5295Nr8.1_fastqc
S5295Nr1.1_fastqc.html  S5295Nr2.1_fastqc.html  S5295Nr3.1_fastqc.html  S5295Nr4.1_fastqc.html  S5295Nr5.1_fastqc.html  S5295Nr6.1_fastqc.html  S5295Nr7.1_fastqc.html  S5295Nr8.1_fastqc.html
S5295Nr1.1_fastqc.zip   S5295Nr2.1_fastqc.zip   S5295Nr3.1_fastqc.zip   S5295Nr4.1_fastqc.zip   S5295Nr5.1_fastqc.zip   S5295Nr6.1_fastqc.zip   S5295Nr7.1_fastqc.zip   S5295Nr8.1_fastqc.zip
S5295Nr1.1.fastq.gz     S5295Nr2.1.fastq.gz     S5295Nr3.1.fastq.gz     S5295Nr4.1.fastq.gz     S5295Nr5.1.fastq.gz     S5295Nr6.1.fastq.gz     S5295Nr7.1.fastq.gz     S5295Nr8.1.fastq.gz
S5295Nr1.2_fastqc       S5295Nr2.2_fastqc       S5295Nr3.2_fastqc       S5295Nr4.2_fastqc       S5295Nr5.2_fastqc       S5295Nr6.2_fastqc       S5295Nr7.2_fastqc       S5295Nr8.2_fastqc
S5295Nr1.2_fastqc.html  S5295Nr2.2_fastqc.html  S5295Nr3.2_fastqc.html  S5295Nr4.2_fastqc.html  S5295Nr5.2_fastqc.html  S5295Nr6.2_fastqc.html  S5295Nr7.2_fastqc.html  S5295Nr8.2_fastqc.html
S5295Nr1.2_fastqc.zip   S5295Nr2.2_fastqc.zip   S5295Nr3.2_fastqc.zip   S5295Nr4.2_fastqc.zip   S5295Nr5.2_fastqc.zip   S5295Nr6.2_fastqc.zip   S5295Nr7.2_fastqc.zip   S5295Nr8.2_fastqc.zip
S5295Nr1.2.fastq.gz     S5295Nr2.2.fastq.gz     S5295Nr3.2.fastq.gz     S5295Nr4.2.fastq.gz     S5295Nr5.2.fastq.gz     S5295Nr6.2.fastq.gz     S5295Nr7.2.fastq.gz     S5295Nr8.2.fastq.gz

#write all summary files to a text file 
/00_untrimmed_fastq$ cat */summary.txt > fastqc_slides2+3_summaries.txt

#show only "FAIL"ed records
/00_untrimmed_fastq$ grep "FAIL" fastqc_slides2+3_summaries.txt 
FAIL	Sequence Duplication Levels	S5295Nr1.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr1.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr1.2.fastq.gz
FAIL	Overrepresented sequences	S5295Nr1.2.fastq.gz
FAIL	Per base sequence content	S5295Nr2.1.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr2.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr2.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr2.2.fastq.gz
FAIL	Overrepresented sequences	S5295Nr2.2.fastq.gz
FAIL	Per base sequence content	S5295Nr3.1.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr3.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr3.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr3.2.fastq.gz
FAIL	Per base sequence content	S5295Nr4.1.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr4.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr4.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr4.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr5.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr5.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr5.2.fastq.gz
FAIL	Overrepresented sequences	S5295Nr5.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr6.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr6.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr6.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr7.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr7.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr7.2.fastq.gz
FAIL	Overrepresented sequences	S5295Nr7.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr8.1.fastq.gz
FAIL	Per sequence GC content	S5295Nr8.2.fastq.gz
FAIL	Sequence Duplication Levels	S5295Nr8.2.fastq.gz

