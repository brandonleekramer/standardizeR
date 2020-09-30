
govData <- readr::read_csv("data/gov_strings.csv")
readr::write_rds(govData, "data/government_data.rds")

library(tidytext)  
 ?unnest_tokens
  
  
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^geological survey)\\b"),
                              yes = "u.s. geological survey", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^fossil energy)\\b"),
                              yes = "u.s. fossil energy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^forest service)\\b"),
                              yes = "u.s. forest service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^senate)\\b"),
                              yes = "u.s. senate", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^mint)\\b"),
                              yes = "u.s. mint", no = institution)) %>%
  
  # high level departments (non-defense)
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(congress—u.s. house of representatives|house of representatives)\\b"),
                              yes = "u.s. house of representatives", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(congress—u.s. senate|u.s. senate)\\b"),
                              yes = "u.s. senate", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(agriculture department|usda|department of agriculture|u.s. department of agriculture|dept of ag|dept of ag.|dept. of ag.|u.s. dept of ag|us dept of ag|u.s. dept. of ag.|u.s. agriculture department)\\b"),
                              yes = "u.s. department of agriculture", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of commerce|^commerce department)\\b"),
                              yes = "u.s. department of commerce", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of education|doed)\\b"),
                              yes = "u.s. department of education", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of energy|doe|energy department)\\b"),
                              yes = "u.s. department of energy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of health and human services|hhs|u.s. department of health & human services|health and human services department)\\b"),
                              yes = "u.s. department of health and human services", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of homeland security|dhs|homeland security department)\\b"),
                              yes = "u.s. department of homeland security", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of housing and urban development|hud|housing and urban development, department of)\\b"),
                              yes = "u.s. department of housing and urban development", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of justice|doj|justice department)\\b"),
                              yes = "u.s. department of justice", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of labor|dol|labor department)\\b"),
                              yes = "u.s. department of labor", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of state|state department)\\b"),
                              yes = "u.s. department of state", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of the interior|interior department)\\b"),
                              yes = "u.s. department of the interior", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of the treasury|treasury department)\\b"),
                              yes = "u.s. department of the treasury", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(us department of veterans affairs|department of veterans affairs|veterans affairs department)\\b"),
                              yes = "u.s. department of veterans affairs", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of transportation|transportation department)\\b"),
                              yes = "u.s. department of transportation", no = institution)) %>%
  # us intelligence and defense
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(defense department|us dod|u.s. dod|u.s. d.o.d.|dept of defense|department of defense|education department)\\b"),
                              yes = "u.s. department of defense", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(CIA)\\b"),
                              yes = "central intelligence agency", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(defense finance and accounting service(?! debt)|dfas)\\b"),
                              yes = "defense finance and accounting service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(debt and claims management center)\\b"),
                              yes = "defense finance and accounting service debt and claims management center", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(air force research laboratory|air force research labs)\\b"),
                              yes = "u.s. air force research laboratory", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(air force reserve|us air force reserve command)\\b"),
                              yes = "u.s. air force reserve command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(air force(?! reserve)|department of the air force|us air force)\\b"),
                              yes = "u.s. air force", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of the army|us army(?! corps)|army(?! corps)|u.s. army(?! corps))\\b"),
                              yes = "u.s. department of the army", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(army corps of engineers|corps of engineers)\\b"),
                              yes = "u.s. army corps of engineers", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(department of the navy|us navy|navy|u.s. navy)\\b"),
                              yes = "u.s. department of the navy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(cyber and infrastructure security agency|cisa)\\b"),
                              yes = "cybersecurity and infrastructure security agency", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(director of national intelligence, office of|director of national intelligence)\\b"),
                              yes = "office of director of national intelligence", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(coast guard)\\b"),
                              yes = "u.s. coast guard", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(health affairs, assistant secretary of defense for)\\b"),
                              yes = "assistant secretary of defense for health affairs", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(marine corps|marines|the marines)\\b"),
                              yes = "u.s. marine corps", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(u.s. military academy, west point|west point military academy|west point)\\b"),
                              yes = "u.s. military academy, west point", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(european command)\\b"),
                              yes = "u.s. european command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(northern command)\\b"),
                              yes = "u.s. northern command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(pacific command)\\b"),
                              yes = "u.s. pacific command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(southern command)\\b"),
                              yes = "u.s. southern command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(strategic command)\\b"),
                              yes = "u.s. strategic command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(central command)\\b"),
                              yes = "u.s. central command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(special forces operations command)\\b"),
                              yes = "u.s. special operations command", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(national guard)\\b"),
                              yes = "u.s. national guard", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(joint military intelligence college)\\b"),
                              yes = "national intelligence university", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(information resource management college|national defense university icollege|college of information and cyberspace)\\b"),
                              yes = "national defense university - college of information and cyberspace", no = institution)) %>%
  
  # bureaus
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(economics and statistics service|economics, statistics, and cooperative service)\\b"),
                              yes = "economic research service", no = institution)) %>% # ers
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(environmental management|environmental management, office of)\\b"),
                              yes = "office of environmental management", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(engraving and printing, bureau of)\\b"),
                              yes = "bureau of engraving and printing", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(economic analysis, bureau of)\\b"), # bea
                              yes = "bureau of economic analysis", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(fiscal service, bureau of the)\\b"),
                              yes = "bureau of the fiscal service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(industry and security, bureau of)\\b"),
                              yes = "bureau of industry and security", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(justice statistics, bureau of)\\b"),
                              yes = "bureau of justice statistics", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(labor statistics, bureau of)\\b"), # bls
                              yes = "bureau of labor statistics", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(land management, bureau of)\\b"), # blm
                              yes = "bureau of land management", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(reclamation, bureau of)\\b"),
                              yes = "bureau of reclamation", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(safety and environmental enforcement, bureau of)\\b"),
                              yes = "bureau of safety and environmental enforcement", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(transportation statistics, bureau of)\\b"),
                              yes = "bureau of transportation statistics", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(ca-cst code reuse library|ca/cst/systems integration & innovation division|consular affairs, bureau of)\\b"),
                              yes = "bureau of consular affairs", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(bureau of ocean energy management, regulation, & enforcement|ocean energy management, bureau of)\\b"),
                              yes = "bureau of ocean energy management", no = institution)) %>% # boem
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(alcohol, tobacco, firearms and explosives bureau|alcohol, tobacco, and firearms division|alcohol, tobacco, firearms and explosives bureau|bureau of alcohol, tobacco, and firearms)\\b"), # ATF = acronym
                              yes = "bureau of alcohol, tobacco, firearms and explosives", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(international labor affairs, bureau of)\\b"), # ATF = acronym
                              yes = "bureau of international labor affairs", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(bureau of the census|census bureau|us census bureau)\\b"),
                              yes = "u.s. census bureau", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(bureau of bureau of indian affairs|indian affairs)\\b"),
                              yes = "bureau of indian affairs", no = institution)) %>%
  
  # offices
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(housing office)\\b"),
                              yes = "office of housing", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(compliance, office of)\\b"),
                              yes = "office of compliance", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(comptroller of the currency, office of)\\b"),
                              yes = "office of comptroller of the currency", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(disability employment policy, office of)\\b"),
                              yes = "office of disability employment policy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(elementary and secondary education, office of)\\b"),
                              yes = "office of elementary and secondary education", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(government ethics, office of)\\b"),
                              yes = "office of government ethics", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(justice programs, office of)\\b"),
                              yes = "office of justice programs", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(juvenile justice and delinquency prevention, office of)\\b"),
                              yes = "office of juvenile justice and delinquency prevention", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(manufactured housing programs, office of)\\b"),
                              yes = "office of manufactured housing programs", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(minority health, office of)\\b"),
                              yes = "office of minority health", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(natural resources revenue, office of)\\b"),
                              yes = "office of natural resources revenue", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(nuclear energy, office of)\\b"),
                              yes = "office of nuclear energy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(pardon attorney, office of)\\b"),
                              yes = "office of pardon attorney", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(postsecondary education, office of)\\b"),
                              yes = "office of postsecondary education", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(refugee resettlement, office of)\\b"),
                              yes = "office of refugee resettlement", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(science and technology policy, office of)\\b"),
                              yes = "office of science and technology policy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(servicemember affairs, office of)\\b"),
                              yes = "office of servicemember affairs", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(special counsel, office of)\\b"),
                              yes = "office of special counsel", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(special education and rehabilitative services, office of)\\b"),
                              yes = "office of special education and rehabilitative services", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(surface mining, reclamation and enforcement, office of)\\b"),
                              yes = "office of surface mining, reclamation and enforcement", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(child support enforcement, office of)\\b"),
                              yes = "office of child support enforcement", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(career, technical, and adult education, office of)\\b"),
                              yes = "office of career, technical, and adult education", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(scientific and technical information, office of)\\b"),
                              yes = "office of scientific and technical information", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(violence against women, office on)\\b"),
                              yes = "office on violence against women", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(office of surface mining, reclamation and enforcement)\\b"),
                              yes = "office of surface mining reclamation and enforcement", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(office of science and technology)\\b"),
                              yes = "office of science and technology policy", no = institution)) %>%
  
  # courts
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(supreme court of the u.s.|the supreme court|supreme court of the us|the supreme court of the u.s.)\\b"),
                              yes = "u.s. supreme court", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(court of appeals for veterans claims)\\b"),
                              yes = "u.s. court of appeals for veterans claims", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(court of appeals for the armed forces)\\b"),
                              yes = "u.s. court of appeals for the armed forces", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(court of appeals for the federal circuit)\\b"),
                              yes = "u.s. court of appeals for the federal circuit", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(court of federal claims)\\b"),
                              yes = "u.s. court of federal claims", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(court of international trade)\\b"),
                              yes = "u.s. court of international trade", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(bankruptcy courts)\\b"),
                              yes = "u.s. bankruptcy courts", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(judicial circuit courts of appeal)\\b"),
                              yes = "u.s. judicial circuit courts of appeal", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(circuit courts of appeal)\\b"),
                              yes = "u.s. circuit courts of appeal", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(federal court interpreters)\\b"),
                              yes = "u.s. federal court interpreters", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(lower courts)\\b"),
                              yes = "u.s. lower courts", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(special courts)\\b"),
                              yes = "u.s. special courts", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(tax court)\\b"),
                              yes = "u.s. tax court", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(court services and offender supervision|court services and offender supervision agency for the district of columbia)\\b"),
                              yes = "court services and offender supervision agency", no = institution)) %>%
  
  # other organizations
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(Fire Administration|USFA)\\b"),
                              yes = "u.s. fire administration", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(Federal Home Loan Mortgage Corporation|Freddie Mac)\\b"),
                              yes = "federal home loan mortgage corporation", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(Federal National Mortgage Association|Fannie Mae)\\b"),
                              yes = "federal national mortgage association", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(Government National Mortgage Association|Ginnie Mae)\\b"),
                              yes = "government national mortgage association", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(united states access board|access board)\\b"),
                              yes = "u.s. access board", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(administration for children and families|acf)\\b"),
                              yes = "administration for children and families", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(advanced distributed learning|adl|adl-aicc)\\b"), # collaboration
                              yes = "advanced distributed learning", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution, # contains a collaboration
                                                pattern = "\\b(?i)(agency for healthcare research and quality|ahrq|agency for health care policy and research)\\b"),
                              yes = "agency for healthcare research and quality", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(agency for international development|usaid)\\b"),
                              yes = "agency for international development", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(agricultural marketing service|ams)\\b"),
                              yes = "agricultural marketing service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(food and agriculture, national institute of|nifa|national institute of food and agriculture|cooperative state research, education, and extension service|national institute of food and agriculture (nifa))\\b"),
                              yes = "national institute of food and agriculture", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(advanced research projects agency-energy|energy transformation acceleration fund|arpa-e)\\b"),
                              yes = "advanced research projects agency-energy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(agriculture research service|usda ars)\\b"), # ARS = acronym
                              yes = "agricultural research service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(ames laboratory|ames lab|doe ames laboratory|the ames lab)\\b"),
                              yes = "ames laboratory", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(ames research center)\\b"),
                              yes = "nasa ames research center", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(tax and trade bureau|bureau of alcohol and tobacco tax and trade)\\b"), # TTB = acronym
                              yes = "alcohol and tobacco tax and trade bureau", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(alcohol, drug abuse, and mental health administration|samhsa)\\b"), # samhsa = acronym
                              yes = "substance abuse and mental health services administration", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(national railroad passenger corporation|amtrak)\\b"),
                              yes = "amtrak", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(animal and plant health inspection service|aphis)\\b"),
                              yes = "animal and plant health inspection service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(archives, national archives and records administration|nara)\\b"),
                              yes = "national archives and records administration", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(arctic llc)\\b"),
                              yes = "arctic landscape conservation cooperative", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(arctic research commission)\\b"),
                              yes = "u.s. arctic research commission", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(argonne national laboratory|argonne national lab|argonne national labs)\\b"),
                              yes = "argonne national laboratory", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(african development bank|african development foundation|nigeria trust fund|banque africaine de développement|banque africaine de dveloppement|banque africaine de developpement)\\b"),
                              yes = "african development bank group", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(arthritis, musculoskeletal and skin diseases, national institute of|niams)\\b"),
                              yes = "national institute of arthritis, musculoskeletal and skin diseases", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(national institute of peace)\\b"),
                              yes = "u.s. institute of peace", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(national institute of health|nih)\\b"),
                              yes = "national institutes of health", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(food and agriculture, national institute of|nifa)\\b"),
                              yes = "national institute of food and agriculture", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(national cancer institute|nci|us nci)\\b"),
                              yes = "national cancer institute", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(barry goldwater scholarship and excellence in education foundation|barry goldwater scholarship|barry goldwater foundation|barry goldwater program)\\b"),
                              yes = "barry m. goldwater scholarship and excellence in education program", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(commission on presidential scholars|presidential scholars commission)\\b"),
                              yes = "commission on presidential scholars", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(center for parent information and resources|parent information and resources center|parent information and resources center)\\b"),
                              yes = "center for parent information and resources", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(cdc public health informatics lab|center for disease control|center for disease control and prevention)\\b"),
                              yes = "centers for disease control and prevention", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(centers for medicare & medicaid services)\\b"),
                              yes = "centers for medicare and medicaid services", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(civil rights division, department of justice|u.s. dept of justice, civil rights division)\\b"),
                              yes = "u.s. department of justice, civil rights division", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(civil rights, department of health and human services office for)\\b"),
                              yes = "u.s. department of health and human services, office for civil rights", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(civil rights, department of education office of)\\b"),
                              yes = "u.s. department of education, office for civil rights", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(corporation for national & community service)\\b"),
                              yes = "corporation for national and community service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(business usa)\\b"),
                              yes = "business usa", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(sandia national laboratory)\\b"),
                              yes = "sandia national laboratories", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(council of inspectors general on integrity and efficiency)\\b"),
                              yes = "council of the inspectors general on integrity and efficiency", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(global media, agency for|Agency for Global Media)\\b"),
                              yes = "u.s. agency for global media", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(grain inspection, packers, and stockyards administration)\\b"),
                              yes = "grain inspection, packers and stockyards administration", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(health resources administration|health services administration|hrsa)\\b"),
                              yes = "health resources and services administration", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(japan-u.s. friendship commission|japan-us friendship commission)\\b"),
                              yes = "japan-u.s. friendship commission", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(john f. kennedy center for performing arts|kennedy center)\\b"),
                              yes = "john f. kennedy center for the performing arts", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(medical payment advisory commission|medpac)\\b"),
                              yes = "medicare payment advisory commission", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(medicaid and chip payment and access commission|macpac)\\b"),
                              yes = "medicaid and chip payment and access commission", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(occupational safety & health review commission)\\b"),
                              yes = "occupational safety and health review commission", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(rural business and cooperative programs)\\b"),
                              yes = "rural business-cooperative service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(u.s. abilityone|u.s. abilityone commission|abilityone|abilityone commission)\\b"),
                              yes = "u.s. abilityone commission", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(us-cert|us computer emergency readiness team|computer emergency readiness team)\\b"),
                              yes = "u.s. computer emergency readiness team", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^weather service|^national weather service)\\b"),
                              yes = "u.s. national weather service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^secret service$)\\b"),
                              yes = "u.s. secret service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(^postal service|us postal service)\\b"),
                              yes = "u.s. postal service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(noaa fisheries|noaa|nmfs)\\b"),
                              yes = "national marine fisheries service", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(capitol visitor center)\\b"),
                              yes = "u.s. capitol visitor center", no = institution)) %>%
  
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(trade representative)\\b"),
                              yes = "u.s. trade representative", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(fedstats)\\b"),
                              yes = "federal interagency council on statistical policy", no = institution)) %>%
  mutate(institution = ifelse(test = str_detect(string = institution,
                                                pattern = "\\b(?i)(federal mediation and conciliation service|mediation and conciliation service|FMCS)\\b"),
                              yes = "federal mediation and conciliation service", no = institution))
rm(govData)
df