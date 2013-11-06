Read.File <- function(name, directory, summarize = FALSE) {

#domains listed on http://www.norid.no/domenenavnbaser/domreg.html

valid.domains<-c(".aero",".asia",".biz",".cat",".com",".coop",".edu",".gov",".info",".int",".jobs",".mil",".mobi",".museum",".name",".net",".org",".pro",".tel",".travel",".ac",".ad",".ae",".af",".ag",".ai",".al",".am",".an",".ao",".aq",".ar",".as",".at",".au",".aw",".ax",".az",".ba",".bb",".bd",".be",".bf",".bg",".bh",".bi",".bj",".bl",".bm",".bn",".bo",".bq",".br",".bs",".bt",".bv",".bw",".by",".bz",".ca",".cc",".cd",".cf",".cg",".ch",".ci",".ck",".cl",".cm",".cn",".co",".cr",".cs",".cu",".cv",".cw",".cx",".cy",".cz",".de",".dj",".dk",".dm",".do",".dz",".ec",".ee",".eg",".eh",".er",".es",".et",".eu",".fi",".fj",".fk",".fm",".fo",".fr",".ga",".gb",".gd",".ge",".gf",".gg",".gh",".gi",".gl",".gm",".gn",".gp",".gq",".gr",".gs",".gt",".gu",".gw",".gy",".hk",".hm",".hn",".hr",".ht",".hu",".id",".ie",".il",".im",".in",".io",".iq",".ir",".is",".it",".je",".jm",".jo",".jp",".ke",".kg",".kh",".ki",".km",".kn",".kp",".kr",".kw",".ky",".kz",".la",".lb",".lc",".li",".lk",".lr",".ls",".lt",".lu",".lv",".ly",".ma",".mc",".md",".me",".mf",".mg",".mh",".mk",".ml",".mm",".mn",".mo",".mp",".mq",".mr",".ms",".mt",".mu",".mv",".mw",".mx",".my",".mz",".na",".nc",".ne",".nf",".ng",".ni",".nl",".no",".np",".nr",".nu",".nz",".om",".pa",".pe",".pf",".pg",".ph",".pk",".pl",".pm",".pn",".pr",".ps",".pt",".pw",".py",".qa",".re",".ro",".rs",".ru",".rw",".sa",".sb",".sc",".sd",".se",".sg",".sh",".si",".sj",".sk",".sl",".sm",".sn",".so",".sr",".ss",".st",".su",".sv",".sx",".sy",".sz",".tc",".td",".tf",".tg",".th",".tj",".tk",".tl",".tm",".tn",".to",".tp",".tr",".tt",".tv",".tw",".tz",".ua",".ug",".uk",".um",".us",".uy",".uz",".va",".vc",".ve",".vg",".vi",".vn",".vu",".wf",".ws",".ye",".yt",".yu",".za",".zm",".zr",".zw",".한국",".ไทย",".இலங்கை",".இந்தியா",".சிங்கப்பூர",".ҚАЗ",".РФ",".СРБ",".УКР",".გე",".भारत",".ભારત",".中国",".中國",".台湾",".台灣",".新加坡",".香港")

# modified "getmoniter" variables and function
name <- as.character(name)
directory <- as.vector(directory)
 summarize <- as.logical(summarize)

#open file. get passed file name and direcories
#do we analys one file or directory? for now, one file



ReadFile<- read.csv(file.path(directory,sprintf("%s.csv",name)),header=TRUE,colClasses = "character", stringsAsFactors=FALSE)
ReadFile[,10]<-as.character(ReadFile[,10])

if (summarize) {
          print(summary(ReadFile))

		 }

	else {
    
	   #return(ReadFile)
	  #count rows in file, no NA's omitted as this would eliminate too much dataß
	  
	   rowcount<-nrow(ReadFile)
	   emails<-as.character(ReadFile[,10])
	   um<-unique(emails)
	   mess1<-paste("Number of bounce incidents:", rowcount)
     
     
	   #if rowcount is greater than 300...
     
  
      uniquecount<-length(um)
        
    mess2<-paste("Number of unique emails:", uniquecount)
     mess3<-paste("Emails bouncing more than once:")
     isdup<-duplicated(emails)
     dup1<-table(ReadFile[,10])
     dups<-subset(dup1,dup1>=2)
   
	   print(mess1)
     print(mess2)
     print(mess3)
     print(dups)
      
	   
	   #count unique emails
	   
	   #count unique email domains (universities, isps, etc)
	   #sum email domains
	   #rank email domains
	   #check domains are valid
	   
	}

}