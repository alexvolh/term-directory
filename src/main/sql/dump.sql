CREATE DATABASE  IF NOT EXISTS `termsdirectorydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `termsdirectorydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: termsdirectorydb
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `english` varchar(128) DEFAULT NULL,
  `russian` varchar(128) DEFAULT NULL,
  `ukraine` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Computing ','Комп\'ютери','Компютеры'),(2,'Mathematics','Математика','Математика'),(3,'Geographical','Географія','Георгафия'),(4,'Military ','Військова термінологія','Военная терминология'),(5,'Transport ','Транстпорт','Транспорт'),(6,'Marine ','Морской термин','Морький термін'),(7,'Economic','Экономика','Екомоніка');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_term`
--

DROP TABLE IF EXISTS `subject_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_term` (
  `subject_id` bigint(20) NOT NULL,
  `term_id` bigint(20) NOT NULL,
  PRIMARY KEY (`subject_id`,`term_id`),
  KEY `subject_term_idx` (`term_id`),
  KEY `term_subject_idx` (`subject_id`),
  CONSTRAINT `fk_subject_term` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_term_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_term`
--

LOCK TABLES `subject_term` WRITE;
/*!40000 ALTER TABLE `subject_term` DISABLE KEYS */;
INSERT INTO `subject_term` VALUES (1,1),(1,2),(1,3),(1,4),(2,5),(2,6),(2,7),(2,8),(2,9),(3,10),(3,11),(3,12),(3,13),(3,14),(4,15),(4,16),(4,17),(4,18),(4,19),(5,20),(5,21),(5,22),(5,23),(6,24),(6,25),(6,26),(6,27),(7,28),(7,29),(7,30);
/*!40000 ALTER TABLE `subject_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `english` varchar(45) DEFAULT NULL,
  `russian` varchar(45) DEFAULT NULL,
  `ukraine` varchar(45) DEFAULT NULL,
  `transcription` varchar(45) DEFAULT NULL,
  `date_time_added` timestamp NULL DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (1,'Webtop ','Вебтоп ','Вебтоп ','webtop','2018-04-07 05:00:32','A web desktop or webtop is a desktop environment embedded in a web browser or similar client application. A webtop integrates web applications, web services, client–server applications, application servers, and applications on the local client into a desktop environment using the desktop metaphor. Web desktops provide an environment similar to that of Windows, Mac, or a graphical user interface on Unix and Linux systems. It is a virtual desktop running in a web browser. In a webtop the applications, data, files, configuration, settings, and access privileges reside remotely over the network. Much of the computing takes place remotely. The browser is primarily used for display and input purposes.\r\n\r\nIn popular use, web desktops are sometimes referred to incorrectly as a web operating system or simply a Web OS.'),(2,'Avatar','Авата́р','Аватар','æv.ə.tɑːr','2018-04-07 04:10:24','\r\nAn example of what avatar could look like, using an anime-like style\r\nIn computing, an avatar is the graphical representation of the user or the user\'s alter ego or character. An icon or figure representing a particular person in a video game, Internet forum, etc. It may take either a three-dimensional form,[1] as in games or virtual worlds, or a two-dimensional form as an icon in Internet forums and other online communities.[2][3] Avatar images have also been referred to as \"picons\" (personal icons)[4] in the past, though the usage of this term is uncommon now. It can also refer to a text construct found on early systems such as MUDs.[5] The term \"avatar\" can also refer to the personality connected with the screen name, or handle, of an Internet user.'),(3,'Information superhighway','Информационный хайвей','Інформаційний хайвей','ɪn.fəˌmeɪ.ʃən suː.pəˈhaɪ.weɪ','2018-04-07 04:15:37','The information superhighway or infobahn[1][2] was a popular term used through the 1990s to refer to digital communication systems and the Internet telecommunications network. It is associated with United States Senator and later Vice-President Al Gore.'),(4,'Snail mail','Улиточная почта','Равликова пошта','ˈsneɪl ˌmeɪl','2018-04-07 04:18:46','Snail mail and smail (from snail + mail) — named after the snail with its slow speed — is a retronym that refers to letters and missives carried by conventional postal delivery services. The phrase refers to the lag-time between dispatch of a letter and its receipt, versus the virtually instantaneous dispatch and delivery of its electronic equivalent, email.\r\n\r\nIt is also known, more neutrally, as paper mail, postal mail, land mail, or simply mail and post. An earlier term of the same type is surface mail, coined retrospectively after the development of airmail. This happened between the 1970s and 1990s.[1]\r\n\r\nSnail mail penfriends or penpals are those that communicate with one another through the postal system, rather than on the Internet which has become the more common medium.\r\n\r\nSome online groups also use paper mail through regular gift or craft hot topics. In some countries, services are available to print and deliver emails to those unable to receive email, like people with no computers or Internet access.\r\n\r\nSimilar terminology was used in the 1840s to contrast the already-operating postal mail with the new telegraph. The Philadelphia North American stated: \"The markets will no longer be dependent upon snail paced mails\"'),(5,'Invariant','Инвариант ','Інваріант ','ɪnˈver.i.ənt','2018-04-07 04:22:14','In mathematics, an invariant is a property, held by a class of mathematical objects, which remains unchanged when transformations of a certain type are applied to the objects. The particular class of objects and type of transformations are usually indicated by the context in which the term is used. For example, the area of a triangle is an invariant with respect to isometries of the Euclidean plane. The phrases \"invariant under\" and \"invariant to\" a transformation are both used. More generally, an invariant with respect to an equivalence relation is a property that is constant on each equivalence class.\r\n\r\nInvariants are used in diverse areas of mathematics such as geometry, topology and algebra. Some important classes of transformations are defined by an invariant they leave unchanged, for example conformal maps are defined as transformations of the plane that preserve angles. The discovery of invariants is an important step in the process of classifying mathematical objects.'),(6,'Coefficient','Коэффициент','Коефіцієнт','koʊ.ɪˈfɪʃ.ənt','2018-04-07 04:24:30','In mathematics, a coefficient is a multiplicative factor in some term of a polynomial, a series or any expression; it is usually a number, but may be any expression. In the latter case, the variables appearing in the coefficients are often called parameters, and must be clearly distinguished from the other variables.\r\n\r\nFor example, in\r\n\r\n{\\displaystyle 7x^{2}-3xy+1.5+y,} {\\displaystyle 7x^{2}-3xy+1.5+y,}\r\nthe first two terms respectively have the coefficients 7 and −3. The third term 1.5 is a constant. The final term does not have any explicitly written coefficient, but is considered to have coefficient 1, since multiplying by that factor would not change the term.\r\n\r\nOften coefficients are numbers as in this example, although they could be parameters of the problem or any expression in these parameters. In such a case one must clearly distinguish between symbols representing variables and symbols representing parameters. Following Descartes, the variables are often denoted by x, y, ..., and the parameters by a, b, c, ..., but it is not always the case. For example, if y is considered as a parameter in the above expression, the coefficient of x is −3y, and the constant coefficient is 1.5 + y.\r\n\r\nWhen one writes\r\n\r\n{\\displaystyle ax^{2}+bx+c} ax^{2}+bx+c,\r\nit is generally supposed that x is the only variable and that a, b and c are parameters; thus the constant coefficient is c in this case.\r\n\r\nSimilarly, any polynomial in one variable x can be written as\r\n\r\n{\\displaystyle a_{k}x^{k}+\\dotsb +a_{1}x^{1}+a_{0}} a_{k}x^{k}+\\dotsb +a_{1}x^{1}+a_{0}\r\nfor some positive integer {\\displaystyle k} k, where {\\displaystyle a_{k},\\dotsc ,a_{1},a_{0}} a_{k},\\dotsc ,a_{1},a_{0} are coefficients; to allow this kind of expression in all cases one must allow introducing terms with 0 as coefficient. For the largest {\\displaystyle i} i with {\\displaystyle a_{i}\\neq 0} a_{i}\\neq 0 (if any), {\\displaystyle a_{i}} a_{i} is called the leading coefficient of the polynomial. So for example the leading coefficient of the polynomial'),(7,'Variable ','Переме́нная ','Змінна','ˈveə.ri.ə.bəl','2018-04-07 04:26:56','In elementary mathematics, a variable is a symbol, commonly an alphabetic character, that represents a number, called the value of the variable, which is either arbitrary, not fully specified, or unknown. Making algebraic computations with variables as if they were explicit numbers allows one to solve a range of problems in a single computation. A typical example is the quadratic formula, which allows one to solve every quadratic equation by simply substituting the numeric values of the coefficients of the given equation to the variables that represent them.\r\n\r\nThe concept of a variable is also fundamental in calculus. Typically, a function y = f(x) involves two variables, y and x, representing respectively the value and the argument of the function. The term \"variable\" comes from the fact that, when the argument (also called the \"variable of the function\") varies, then the value varies accordingly.[1]\r\n\r\nIn more advanced mathematics, a variable is a symbol that denotes a mathematical object, which could be a number, a vector, a matrix, or even a function. In this case, the original property of \"variability\" of a variable is not kept (except, sometimes, for informal explanations).\r\n\r\nSimilarly, in computer science, a variable is a name (commonly an alphabetic character or a word) representing some value represented in computer memory. In mathematical logic, a variable is either a symbol representing an unspecified term of the theory, or a basic object of the theory, which is manipulated without referring to its possible intuitive interpretation.'),(8,'Constructive proof','Конструктивное доказательство','Конструктивне доведення','kənˈstrʌk.tɪv pruːf','2018-04-07 04:30:01','In mathematics, a constructive proof is a method of proof that demonstrates the existence of a mathematical object by creating or providing a method for creating the object. This is in contrast to a non-constructive proof (also known as an existence proof or pure existence theorem) which proves the existence of a particular kind of object without providing an example.\r\n\r\nSome non-constructive proofs show that if a certain proposition is false, a contradiction ensues; consequently the proposition must be true (proof by contradiction). However, the principle of explosion (ex falso quodlibet) has been accepted in some varieties of constructive mathematics, including intuitionism.\r\n\r\nConstructivism is a mathematical philosophy that rejects all but constructive proofs in mathematics. This leads to a restriction on the proof methods allowed (prototypically, the law of the excluded middle is not accepted) and a different meaning of terminology (for example, the term \"or\" has a stronger meaning in constructive mathematics than in classical).\r\n\r\nConstructive proofs can be seen as defining certified mathematical algorithms: this idea is explored in the Brouwer–Heyting–Kolmogorov interpretation of constructive logic, the Curry–Howard correspondence between proofs and programs, and such logical systems as Per Martin-Löf\'s Intuitionistic Type Theory, and Thierry Coquand and Gérard Huet\'s Calculus of Constructions.'),(9,'Theorem','Теорема','Теорема','ˈθiː.rəm','2018-04-07 04:31:47','In mathematics, a theorem is a statement that has been proven on the basis of previously established statements, such as other theorems, and generally accepted statements, such as axioms. A theorem is a logical consequence of the axioms. The proof of a mathematical theorem is a logical argument for the theorem statement given in accord with the rules of a deductive system. The proof of a theorem is often interpreted as justification of the truth of the theorem statement. In light of the requirement that theorems be proved, the concept of a theorem is fundamentally deductive, in contrast to the notion of a scientific law, which is experimental.[2]\r\n\r\nMany mathematical theorems are conditional statements. In this case, the proof deduces the conclusion from conditions called hypotheses or premises. In light of the interpretation of proof as justification of truth, the conclusion is often viewed as a necessary consequence of the hypotheses, namely, that the conclusion is true in case the hypotheses are true, without any further assumptions. However, the conditional could be interpreted differently in certain deductive systems, depending on the meanings assigned to the derivation rules and the conditional symbol.\r\n\r\nAlthough they can be written in a completely symbolic form, for example, within the propositional calculus, theorems are often expressed in a natural language such as English. The same is true of proofs, which are often expressed as logically organized and clearly worded informal arguments, intended to convince readers of the truth of the statement of the theorem beyond any doubt, and from which a formal symbolic proof can in principle be constructed. Such arguments are typically easier to check than purely symbolic ones—indeed, many mathematicians would express a preference for a proof that not only demonstrates the validity of a theorem, but also explains in some way why it is obviously true. In some cases, a picture alone may be sufficient to prove a theorem. Because theorems lie at the core of mathematics, they are also central to its aesthetics. Theorems are often described as being \"trivial\", or \"difficult\", or \"deep\", or even \"beautiful\". These subjective judgments vary not only from person to person, but also with time: for example, as a proof is simplified or better understood, a theorem that was once difficult may become trivial. On the other hand, a deep theorem may be stated simply, but its proof may involve surprising and subtle connections between disparate areas of mathematics. Fermat\'s Last Theorem is a particularly well-known example of such a theorem.'),(10,'Terrain','Рельеф','Рельєф','təˈreɪn','2018-04-07 04:35:20','Present-day Earth altimetry and bathymetry. Data from the National Geophysical Data Center\'s TerrainBase Digital Terrain Model.\r\n\r\nRelief map of Sierra Nevada\r\n\r\nA shaded and colored image (i.e. terrain is enhanced) of varied terrain from the Shuttle Radar Topography Mission. This shows elevation model of New Zealand\'s Alpine Fault running about 500 km (300 mi) long. The escarpment is flanked by a vast chain of hills between the fault and the mountains of New Zealand\'s Southern Alps. Northeast is towards the top.\r\nTerrain or relief (also topographical relief) involves the vertical and horizontal dimensions of land surface. The term bathymetry is used to describe underwater relief, while hypsometry studies terrain relative to sea level. The Latin word terra (the root of terrain) means \"earth.\"\r\n\r\nIn physical geography, terrain is the lay of the land. This is usually expressed in terms of the elevation, slope, and orientation of terrain features. Terrain affects surface water flow and distribution. Over a large area, it can affect weather and climate patterns.'),(11,'Globe','Глобус','Глобус','ɡloʊb','2018-04-07 04:37:38','A globe is a spherical model of Earth, of some other celestial body, or of the celestial sphere. Globes serve similar purposes to maps, but unlike maps, do not distort the surface that they portray except to scale it down. A globe of Earth is called a terrestrial globe. A globe of the celestial sphere is called a celestial globe.\r\n\r\nA globe shows details of its subject. A terrestrial globe shows land masses and water bodies. It might show nations and prominent cities and the network of latitude and longitude lines. Some have raised relief to show mountains. A celestial globe shows stars, and may also show positions of other prominent astronomical objects. Typically it will also divide the celestial sphere up into constellations.\r\n\r\nThe word \"globe\" comes from the Latin word globus, meaning \"sphere\". Globes have a long history. The first known mention of a globe is from Strabo, describing the Globe of Crates from about 150 BC. The oldest surviving terrestrial globe is the Erdapfel, wrought by Martin Behaim in 1492. The oldest surviving celestial globe sits atop the Farnese Atlas, carved in the 2nd century Roman Empire.'),(12,'Human settlement','Населённый пункт','Населений пункт','ˈhjuː.mən ˈset̬.əl.mənt','2018-04-07 04:39:38','In geography, statistics and archaeology, a settlement, locality or populated place is a community in which people live. A settlement can range in size from a small number of dwellings grouped together to the largest of cities with surrounding urbanized areas. Settlements may include hamlets, villages, towns and cities. A settlement may have known historical properties such as the date or era in which it was first settled, or first settled by a particular people.\r\n\r\nIn the field of geospatial predictive modeling, settlements are \"a city, town, village or other agglomeration of buildings where people live and work.\"[1]\r\n\r\nA settlement conventionally includes its constructed facilities such as roads, enclosures, field systems, boundary banks and ditches, ponds, parks and woods, wind and water mills, manor houses, moats and churches.[2]\r\n\r\nThe oldest remains that have been found of constructed dwellings are remains of huts that were made of mud and branches around 17,000 BC at the Ohalo site (now underwater) near the edge of the Sea of Galilee. The Natufians built houses, also in the Levant, around 10,000 BC. Remains of settlements such as villages become much more common after the invention of agriculture.'),(13,'Equator','Экватор','Екватор','ɪˈkweɪ.t̬ɚ','2018-04-07 04:41:31','An equator is the intersection of the surface of a rotating sphere (such as a planet) with the plane perpendicular to the axis of rotation and midway between its poles.\r\nOn Earth, the Equator is an imaginary line on the surface, equidistant from the North and South Poles, dividing the Earth into Northern and Southern Hemispheres. It is about 40,075 kilometres (24,901 mi) long, of which 78.7% lies across water and 21.3% over land.'),(14,'Peninsula','Полуостров','Півострів','pəˈnɪn.sə.lə','2018-04-07 04:43:33','A peninsula (Latin: paeninsula from paene \"almost” and insula \"island\") is a piece of land surrounded by water on the majority of its border, while being connected to a mainland from which it extends. Examples are the Upper and Lower peninsulas of the U.S. state of Michigan, the Scandinavian Peninsula and the Malay peninsula.[1][2][3][4] The surrounding water is usually understood to be continuous, though not necessarily named as a single body of water. Peninsulas are not always named as such; one can also be a headland, cape, island promontory, bill, point, or spit.[5] A point is generally considered a tapering piece of land projecting into a body of water that is less prominent than a cape.[6] A river which courses through a very tight meander is also sometimes said to form a \"peninsula\" within the (almost closed) loop of water. In English, the plurals of peninsula are peninsulas and, less commonly, peninsulae.'),(15,'Sconce (fortification)','Шанец','Шанець','skɑːns','2018-04-07 04:49:26','A sconce is a small protective fortification, such as an earthwork, often placed on a mound as a defensive work for artillery.[1] It was used primarily in Northern Europe from the late Middle Ages until the 19th century. This type of fortification was common during the English Civil War, and the remains of one such structure can be seen on Fort Royal Hill in Worcester, England.[2] During the Eighty Years\' War for Dutch independence, the sconces (schans in Dutch) were often used to defend strategic places, but were used also during sieges and in circumvallations. Several more or less intact sconces remain in the Netherlands. The Zaanse Schans, one of the top tourist locations in the Netherlands, derived its name from its original function as a sconce. Sconces played a major part in the Serbian Revolution, countering the numerical superiority of the Turkish army.'),(16,'Lodgement','Плацдарм','Плацдарм','ˈlɒdʒmənt','2018-04-07 04:51:37','A lodgement is an enclave taken by and defended by force of arms against determined opposition made by increasing the size of a bridgehead, beachhead or airhead[1] into a substantial defended area, at least the rear parts of which are out of direct line of fire.[2] An example is Operation Overlord, the establishment of a large-scale lodgement in Normandy during World War II.[3]'),(17,'Flag officer','Флагман','Флагман','flæɡ ˈɑː.fɪ.sɚ','2018-04-07 04:54:50','A flag officer is a commissioned officer in a nation\'s armed forces senior enough to be entitled to fly a flag to mark the position from which the officer exercises command.\r\n\r\nThe term is used differently in different countries:\r\n\r\nIn many countries, a flag officer is a senior officer of the navy, specifically those who hold any of the admiral ranks; the term may or may not include the rank of commodore.\r\nIn some countries, such as Bangladesh, the United States, Pakistan and India, it may apply to all armed forces, not just the navy. This means generals can also be considered flag officers.\r\nIn most Arab armies, liwa (Arabic: لواء), which can be translated as flag officer, is a specific rank, equivalent to a major general. However, \"ensign\" is debatably a more exact translation of the word. In principle, a flag officer commands several units called \"flags\" (or \"ensigns\") (i.e. brigades).\r\n'),(18,'Shoulder mark','Погоны','Погон','ʃoʊl.dɚ mɑːrk','2018-04-07 04:58:01','A shoulder mark, also called an epaulette, shoulder board, rank slide, or slip-on ,[1] is a flat cloth sleeve worn on the shoulder strap of a uniform. It may bear rank or other insignia.'),(19,'Defection','Перебежчик','Перебіжчик','ˈdiː.fekt','2018-04-07 04:59:40','In politics, a defector is a person who gives up allegiance to one state in exchange for allegiance to another, in a way which is considered illegitimate by the first state.[1] More broadly, it involves abandoning a person, cause, or doctrine to which one is bound by some tie, as of allegiance or duty.[2][3]\r\n\r\nThis term is also applied, often pejoratively, to anyone who switches loyalty to another religion, sports team, political party, or other rival faction. In that sense, the defector is often considered a traitor by their original side.'),(20,'Cargo','Груз','Вантаж','ˈkɑːr.ɡoʊ','2018-04-07 05:05:01','Cargo or freight are goods or produce being conveyed – generally for commercial gain – by water, air or land. Cargo was originally a shipload. Cargo now covers all types of freight, including that carried by train, van, truck, or intermodal container.[1] The term cargo is also used in case of goods in the cold-chain, because the perishable inventory is always in transit towards a final end-use, even when it is held in cold storage or other similar climate-controlled facility.\r\n\r\nMulti-modal container units, designed as reusable carriers to facilitate unit load handling of the goods contained, are also referred to as cargo, specially by shipping lines and logistics operators. Similarly, aircraft ULD boxes are also documented as cargo, with associated packing list of the items contained within. When empty containers are shipped each unit is documented as a cargo and when goods are stored within, the contents are termed as containerised cargo.'),(21,'Hand luggage','Ручная кладь','Ручна поклажа','ˈhænd ˌlʌɡ.ɪdʒ','2018-04-07 05:06:49','The term hand luggage or cabin baggage (also commonly referred to as carry-on in North America) refers to the type of luggage that passengers are allowed to carry along in the passenger compartment of a vehicle instead of moving to the cargo compartment. Passengers are allowed to carry a limited number of smaller bags with them in the vehicle and contain valuables and items needed during the journey. There is normally storage space provided for hand luggage, either under seating, or in overhead lockers. Trains usually have luggage racks above the seats and may also (especially in the case of trains travelling longer distances) have luggage space between the backs of seats facing opposite directions, or in extra luggage racks, for example, at the ends of the carriage near the doors.'),(22,'Axle track','Колея','Колія коліс','ˈæk.səl træk','2018-04-07 05:09:23','The axle track in automobiles and other wheeled vehicles which have two or more wheels on an axle, is the distance between the centerline of two roadwheels on the same axle. In a case of the axle with dual wheels, the centerline in the middle of the dual wheel is used for the axle track specification.\r\n\r\nIn a vehicle with two axles, this is expressed as \"front track\" and \"rear track\".\r\n\r\nHowever the front wheels and/or rear wheels on either side of a vehicle do not necessarily have to be mounted on the same axle for the distance that they are apart to be called the \"track\".'),(23,'Counterweight','Противовес (контргруз) ','Противага','ˈkaʊn.t̬ɚ.weɪt','2018-04-07 05:45:53','Counterweights are often used in traction lifts (elevators), cranes and funfair rides. In these applications, the expected load multiplied by the distance that load will be spaced from the central support (called the \"tipping point\") must be equal to the counterweight\'s mass times its distance from the tipping point in order to prevent over-balancing either side. This distance times mass is called the load moment.[3]\r\n\r\nA counterbalance is a weight or force that balances or offsets another as when two objects of equal weight, power, or influence are acting in opposition to each other. The objects are then said to be in counterbalance.'),(24,'Naval boarding','Абордаж','Абордаж','ˈneɪ.vəl ˈbɔːr.dɪŋ','2018-04-07 05:49:04','Naval boarding is to come up against, or alongside, an enemy ship to attack by placing combatants aboard the enemy ship. The goal of boarding is to capture, or destroy, the enemy vessel. Larger ships carried specially trained and equipped sailors, or marines, as boarders.\r\n\r\nA cutting out boarding is an attack by small boats, preferably at night and against an unsuspecting, and anchored, target. It became popular in the later 18th century, and was extensively used during the Napoleonic Wars. This heralded the emphasis on stealth, and surprise, that would come to dominate future boarding tactics. An example is the successful cutting out of the Hermione which took place at Puerto Cabello, Venezuela, on 25 October 1799.\r\n\r\nIn modern warfare, boarding by military forces almost always involves stealth, and usually takes place at night. It may involve the use of small submarines or submersibles, or inflatable boats, or by scuba divers. All involve scaling the sides of the ship. When stealth is not as important, helicopters may be used to carry troops to the deck of the ship'),(25,'Cabotage','Каботаж','Каботаж','ˈkæbətɑʒ','2018-04-07 05:51:15','Кабота́ж (фр. cabotage) — термин, использующийся для обозначения «плавания коммерческого грузового или пассажирского судна между морскими портами одного и того же государства». Название термина происходит от испанского слова cabo, которое означает «мыс»[1].\r\n\r\nИзначально под термином «каботаж» понимали плавание «от мыса к мысу» без выхода в открытое море[2][3]. Это и следует считать оригинальным толкованием данного термина. В каботажном плавании почти всё время находились корабли античных мореходов — сначала египтян, затем греков и римлян, а позднее и викингов.\r\n\r\nТак как в настоящее время почти во всех странах каботаж является исключительным правом торгового флота этих стран, то «мореходный» каботаж стал равен «юридическому». То есть, нередко употребляющие термин «каботажное плавание» подразумевают под ним «плавание без выхода за границы страны».\r\n\r\nРазличают большой каботаж (перевозку грузов и пассажиров между портами разных морей) и малый каботаж (перевозки между портами одного и того же моря).\r\n\r\nВ бывшем СССР в отношении к каботажу рассматривались как одно море:\r\n\r\nЧёрное и Азовское моря\r\nБелое море и Северный Ледовитый океан\r\nЯпонское, Охотское и Берингово моря\r\nКак правило, каботаж осуществляется каботажным флотом — судами, предназначенными для совершения плавания в ограниченном районе, обычно на небольшом удалении от берега и портов-убежищ.\r\n\r\nСамым крупным в мире каботажным флотом обладает Греция.'),(26,'Forecastle','Бак (морской термин)','Бак (морський термін)','ˈfɔːr.kæs.tɚ','2018-04-07 05:53:23','Бак (нидерл. bak) — передняя часть палубы (от носа до фок-мачты) или палубы носовой надстройки[1][2].\r\n\r\nНадстройку над верхней палубой в носовой части корабля называется полубак[1]. Удлинённый полубак может занимать до 2/3 длины судна[3].\r\n\r\nОсновное назначение полубака заключается в увеличении высоты борта в носовой части корабля, что важно для обеспечения хорошей мореходности, защиты верхней палубы от заливания при встречной волне и повышения непотопляемости. В удлинённом баке на грузовых судах располагают грузовые твиндеки, на пассажирских судах — каюты.\r\n\r\nНа баке или внутри полубака обычно располагают якорное и швартовное устройства.'),(27,'Sail','Парус','Вітрило','seɪl','2018-04-07 05:55:27','A sail is a tensile structure—made from fabric or other membrane materials—that uses wind power to propel sailing craft, including sailing ships, sailboats, windsurfers, ice boats, and even sail-powered land vehicles. Sails may be made from a combination of woven materials—including canvas or polyester cloth, laminated membranes or bonded filaments—usually in a three- or four-sided shape.\r\n\r\nA sail provides propulsive force via a combination of lift and drag, depending on its angle of attack—its angle with respect to the apparent wind. Apparent wind is the air velocity experienced on the moving craft and is the combined effect of the true wind velocity with the velocity of the sailing craft. Angle of attack is often constrained by the sailing craft\'s orientation to the wind or point of sail. On points of sail where it is possible to align the leading edge of the sail with the apparent wind, the sail may act as an airfoil, generating propulsive force as air passes along its surface—just as an airplane wing generates lift—which predominates over aerodynamic drag retarding forward motion. The more that the angle of attack diverges from the apparent wind as a sailing craft turns downwind, the more drag increases and lift decreases as propulsive forces, until a sail going downwind is predominated by drag forces. Sails are unable to generate propulsive force if they are aligned too closely to the wind.\r\n\r\nSails may be attached to a mast, boom or other spar or may be attached to a wire that is suspended by a mast. They are typically raised by a line, called a halyard, and their angle with respect to the wind is usually controlled by a line, called a sheet. In use, they may be designed to be curved in both directions along their surface, often as a result of their curved edges. battens may be used to extend the trailing edge of a sail beyond the line of its attachment points.\r\n\r\nOther non-rotating airfoils that power sailing craft include wingsails, which are rigid wing-like structures, and kites that power kite-rigged vessels, but do not employ a mast to support the airfoil and are beyond the scope of this article.'),(28,'Aval','Аваль ','Аваль','əˈvæl','2018-04-07 05:58:56','Аваль (фр. aval, предположительно от араб. حوالة‎) — поручительство по векселю или чеку; допускается для любого лица, кроме плательщика. Авалист ответствен наравне с векселедателем, причём его обязательство действительно даже в том случае, если то обязательство, которое он гарантировал, окажется недействительным по какому бы то ни было основанию, иному, чем дефект формы. В этом отношении аваль совершенно равен не поручительству, которое носит дополнительный (акцессо́рный) характер по отношению к основному обязательству, а банковской гарантии.\r\n\r\nАваль осуществляется путём надписи на векселе или чеке; он приписывает своё имя к имени плательщика, прибавляя к этому слова «per aval» (или «считать за аваль» или любую равнозначную формулу) и проставлением подписи тем, кто даёт аваль. Однако для действительности аваля достаточно и одной только подписи авалиста на лицевой стороне векселя или чека, если только эта подпись не поставлена плательщиком или векселедателем.\r\n\r\nВ авале должно быть указано, за кого он дан. При отсутствии такого указания он считается данным за векселедателя или чекодателя.\r\n\r\nОплачивая вексель или чек, авалист приобретает права, вытекающие из векселя или чека, в отношении к тому, за кого он дал гарантию, и в отношении также и тех, которые в силу векселя или чека обязаны перед этим последним.\r\n\r\nАваль может размещаться на оборотной стороне векселя или на аллонже.'),(29,'Benchmarking','Бенчмаркинг','Бенчмаркінг','ˈbentʃ.mɑːrk','2018-04-07 06:00:40','Benchmarking is comparing one\'s business processes and performance metrics to industry bests and best practices from other companies. In project management benchmarking can also support the selection, planning and delivery of projects.[1] Dimensions typically measured are quality, time and cost. In the process of best practice benchmarking, management identifies the best firms in their industry, or in another industry where similar processes exist, and compares the results and processes of those studied (the \"targets\") to one\'s own results and processes. In this way, they learn how well the targets perform and, more importantly, the business processes that explain why these firms are successful. According to National Council on Measurement in Education, benchmark assessments [2] are short assessments used by teachers at various times throughout the school year to monitor student progress in some area of the school curriculum. These also are known as interim assessments.\r\n\r\nBenchmarking is used to measure performance using a specific indicator (cost per unit of measure, productivity per unit of measure, cycle time of x per unit of measure or defects per unit of measure) resulting in a metric of performance that is then compared to others.[3]\r\n\r\nAlso referred to as \"best practice benchmarking\" or \"process benchmarking\", this process is used in management which particularly shows VEMR strategic management, in which organizations evaluate various aspects of their processes in relation to best practice companies\' processes, usually within a peer group defined for the purposes of comparison. This then allows organizations to develop plans on how to make improvements or adapt specific best practices, usually with the aim of increasing some aspect of performance. Benchmarking may be a one-off event, but is often treated as a continuous process in which organizations continually seek to improve their practices.'),(30,'Deficit','Дефицит','Дефіцит','ˈdef.ə.sɪt','2018-04-07 06:02:54','A deficit is the amount by which a sum falls short of some reference amount.\r\n\r\nIn economics, a deficit is an excess of expenditures over revenue in a given time period; in more specific cases it may refer to:\r\n\r\nBalance of payments deficit, when the balance of payments is negative\r\nGovernment budget deficit\r\nDeficit spending\r\nPrimary deficit, the pure deficit derived after deducting the interest payments\r\nStructural and cyclical deficit, parts of the public sector deficit\r\nIncome deficit, the difference between family income and the poverty threshold\r\nTrade deficit, when the value of imports exceed the value of exports');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-07  9:08:17
