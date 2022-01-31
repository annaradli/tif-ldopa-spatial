# tif-ldopa-slide1

<h2>Description of the project</h2>


### Samples summary

|Library ID| Visium Slide Area ID | Mouse ID | Group | Double TT Index Well ID|
|---------| -------------------- | -------- | ------| -----------------------|
|1| A1                   | 1-1      | mutant saline | A3 |
|2|B1| 2-2 | mutant L-DOPA | B3|
|3|C1| 3-2 | mutant L-DOPA  | C3|
|4|D1| 3-4 | mutant saline  | D3 |

### RNA-seq samples summary 
|Library number ID|Filename|Sequence type|FastQC failed parameters|
|---|---|---|---|
|1|S5023Nr1.1|Read 1|Sequence Duplication Levels|
|1|S5023Nr1.2|Read 2|Sequence Duplication Levels, Per sequence GC content, Overrepresented sequences|
|2|S5023Nr2.1|Read 1|Sequence Duplication Levels|
|2|S5023Nr2.2|Read 2|Sequence Duplication Levels, Per sequence GC content|
|3|S5023Nr3.1|Read 1|Sequence Duplication Levels|
|3|S5023Nr3.2|Read 2|Sequence Duplication Levels, Per sequence GC content, Overrepresented sequences, Per base sequence content|
|4|S5023Nr4.1|Read 1|Sequence Duplication Levels|
|4|S5023Nr4.2|Read 2|Sequence Duplication Levels, Per sequence GC content, Overrepresented sequences|

<h2>Labnotes</h2>
Downloaded RNA-seq data. <br />
Performed fastQC and md5sum checking.<br />

### 2022-01-27
Downloaded new spaceranger v1.3.1  from 10x Genomics webiste. Uploaded fastq.gz files to the server. New project - "tif-ldopa". <br />

### 2022-01-28
Checked md5sums of spaceranger, refernce genome assembly (from the risperidone project), and fastq.gz files. All correct. Prepended new spaceranger Ran `spaceranger sitecheck` and `spaceranger testrun` successfully. Ran analysis on first of the samples from 16:52 - .21:02. but with WRONG ARGUMENTS!- <br />

Renamed the fastq files in the following (Illumina) [convention](https://support.illumina.com/help/BaseSpace_OLH_009008/Content/Source/Informatics/BS/NamingConvention_FASTQ-files-swBS.htm): <br /> ==> HENCE, THE WRONG AND TIME CONSUMING ANALYSIS! Because every file started with "S5023Nr1"!

S5023Nr1.1.fastq.gz S5023Nr1_S1_L001_R1_001.fastq.gz <br />
S5023Nr1.2.fastq.gz S5023Nr1_S1_L001_R2_001.fastq.gz <br />
S5023Nr2.2.fastq.gz S5023Nr1_S2_L001_R2_001.fastq.gz <br />
S5023Nr2.1.fastq.gz S5023Nr1_S2_L001_R1_001.fastq.gz <br />
S5023Nr3.1.fastq.gz S5023Nr1_S3_L001_R1_001.fastq.gz <br />
S5023Nr3.2.fastq.gz S5023Nr1_S3_L001_R2_001.fastq.gz <br />
S5023Nr4.2.fastq.gz S5023Nr1_S4_L001_R2_001.fastq.gz <br />
S5023Nr4.1.fastq.gz S5023Nr1_S4_L001_R1_001.fastq.gz <br />

### 2022-01-29
Changed names of the fastq files into the correct ones (S5023Nr2_S2, etc.) and ran a new analysis on all 4 samples. Also, copied the yesterdays data to a pendrive. <br />
Downloaded file names => changed, correct new names, necessary for the analysis <br />
S5023Nr1.1.fastq.gz => S5023Nr1_S1_L001_R1_001.fastq.gz <br />
S5023Nr1.2.fastq.gz => S5023Nr1_S1_L001_R2_001.fastq.gz <br />
S5023Nr2.2.fastq.gz => S5023Nr2_S2_L001_R2_001.fastq.gz <br />
S5023Nr2.1.fastq.gz => S5023Nr2_S2_L001_R1_001.fastq.gz <br />
S5023Nr3.1.fastq.gz => S5023Nr3_S3_L001_R1_001.fastq.gz <br />
S5023Nr3.2.fastq.gz => S5023Nr3_S3_L001_R2_001.fastq.gz <br />
S5023Nr4.2.fastq.gz => S5023Nr4_S4_L001_R2_001.fastq.gz <br />
S5023Nr4.1.fastq.gz => S5023Nr4_S4_L001_R1_001.fastq.gz <br />

### 2022-01-30
Copied cloupe and .html files onto pendrive. Copied all results into external disc. Ran spaceranger aggr.

### 2022-01-31
Ran FASTQC on samples (on the local machine, files on extrernal disc).

### Software 
* spaceranger v1.3.1
* mouse genome mm10 Reference - 2020-A 
* fastQC v0.11.8
* md5sum v8.28
* Loupe Browser v6.0

