load("rda/murders.rda")
r<-murders %>% 
  summarise(rate=sum(total)/sum(population)*10^6) %>% .$rate
murders %>% ggplot(aes(population/10^6,total,label=abb))+
  geom_abline(intercept = log10(r),lty=1,col="brown")+
  geom_point(aes(col=region),size=3)+
  geom_text_repel()+
  scale_x_log10()+
  scale_y_log10()+
  ggtitle("US Murder rate in 2010")+
  xlab("Population in million(log scale)")+
  ylab("Total number of murders(log scale)")+
  scale_color_discrete(name="Region")+
  theme_economist()
ggsave("fig/scatterplot.png")
