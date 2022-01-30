## Use to format spectra for statistical analysis

#basic loads
rm(list=ls())
library(tcltk2)

#Function: Read Multiple Spectral Scans 
read.spectraldata<-function(){	
  speclist<-tk_choose.files()
  n<-length(speclist)
  data<-names<-NULL
  for (i in 1:n){
    temp<-read.table(speclist[i],skip=17,nrows=2048,header=T)
    temp[,1]<-trunc(temp[,1])						#round off nm column
    temp.scan<-subset(temp,temp[,1] > 299 & temp[,1]< 701)	#only 300-700nm
    temp.spectral.data<-tapply(temp.scan[,5],temp.scan[,1],mean)
    tempname<-basename(speclist[i])
  data<-rbind(data,temp.spectral.data)
  names<-rbind(names,tempname)
  }
  return(list(nmdata=data,specnames=names))
}

#Read data
spectral.data<-read.spectraldata() # when prompted, highlight all spectra in this folder

spectra<-spectral.data$nmdata
spectra[spectra<0]<-0
spectra2<-cbind(spectral.data$specnames[,1],spectra)
write.csv(spectra2,"spectra.csv")