--
-- Dữ liệu cho bảng Category
--

INSERT INTO Category ([Name]) VALUES ('Science');		--1
INSERT INTO Category ([Name]) VALUES ('Mystery');		--2
INSERT INTO Category ([Name]) VALUES ('Light Novel');	--3
INSERT INTO Category ([Name]) VALUES ('Romance');		--4
INSERT INTO Category ([Name]) VALUES ('Fantasy');		--5

--
-- Dữ liệu cho bảng Author
--

INSERT INTO Author ([Name]) VALUES ('Isaac Asimov');    -- 1 -- Scienece (1)
INSERT INTO Author ([Name]) VALUES ('Agatha Christie'); -- 2 -- Mystery (2)
INSERT INTO Author ([Name]) VALUES ('Stephen Hawking');    -- 3 -- Scienece (1)
INSERT INTO Author ([Name]) VALUES ('Jane Austen');		-- 4 -- Romance (4)
INSERT INTO Author ([Name]) VALUES ('Shiori Ota');      -- 5 -- Light Novel (3)
INSERT INTO Author ([Name]) VALUES ('Dan Brown');       -- 6 -- Fantasy (5)

--
-- Dữ liệu cho bảng Publisher
--

INSERT INTO Publisher ([Name]) VALUES ('Alpha Books');        -- 1
INSERT INTO Publisher ([Name]) VALUES ('Mega World');         -- 2
INSERT INTO Publisher ([Name]) VALUES ('IPM');                -- 3
INSERT INTO Publisher ([Name]) VALUES ('Sakura Light Novel'); -- 4

--
-- Dữ liệu cho bảng Book
--

-- Alpha Books 

-- Science
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, [Description], Rate, Rate_Count, Sold, [Image]) 
VALUES (19.99, 'Foundation', 1, 1, 1, 1951, 50, 'The premise of the stories is that in the waning days of a future Galactic Empire, the mathematician Hari Seldon
spends his life developing a theory of psychohistory. Using statistical laws of mass action,
it can predict the future of large populations. Seldon foresees the imminent fall of the Empire.', 4.3, 200, 100,
'images/book_image/Foundation_gnome.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (18.99, 'Dune', 1, 3, 1, 1965, 50, 'A science fiction epic set in a distant future where noble houses vie for control over the desert planet Arrakis,
the only known source of the valuable spice melange. As political intrigue and betrayal unfold, young Paul Atreides must navigate a dangerous path to fulfill his
destiny.', 4.5, 250, 120,
'images/book_image/Dune.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (18.99, 'Einstein: His Life and Universe', 1, 1, 1, 1965, 50, 'The author describes Einsteins insolent streak and how the sometimes abrasive nature around
it cost Einstein much in the short term, though larger society benefited dramatically in the long run. After going through his studies in physics with "a sassy
attitude" at the Zurich Polytechnic, Einstein wound up being the only graduate of his years class not to be offered a job. The author notes Einsteins subsequent
trek throughout Europe in search of work and its failure. "I will soon have graced every physicist from the North Sea to the southern
tip of Italy with my offer," Einstein is quoted as writing. Rejected by the Swiss army for his misshapen feet and varicose veins,
Isaccson details, Einstein finally managed to start a career at the Swiss patent office. Despite the mediocre posting, his independent research into his
intellectual passions proved highly influential as Isaacson describes', 4.5, 250, 120,
'images/book_image/Einstein.webp');

-- Mystery
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (14.99, 'Murder on the Orient Express', 2, 2, 1, 1934, 60, '"Murder on the Orient Express" is a classic detective novel set aboard the luxurious
Orient Express train. The story begins when a wealthy and infamous passenger is found murdered in his compartment. With the train trapped in a snowdrift,
detective Hercule Poirot happens to be on board and takes on the task of solving the perplexing mystery. As Poirot investigates, he uncovers a web of secrets,
lies, and hidden motives among the passengers. The tension mounts as Poirot navigates through the intricate alibis and conflicting testimonies,
ultimately leading to a surprising and dramatic resolution.', 4.6, 300, 150,
'images/book_image/murder-on-the-orient-express_cover.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (15.99, 'The Da Vinci Code', 2, 6, 1, 2003, 70, 'The Da Vinci Code is a gripping thriller that follows symbologist Robert Langdon as he delves into
a complex mystery involving religious symbology, secret societies, and hidden messages. Racing against time, Langdon and cryptologist Sophie Neveu uncover
shocking truths about the Holy Grail and the true identity of historical figures.', 4.7, 300, 150,
'images/book_image/davincicode.webp');

-- Light Novel
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (24.99, 'Beautiful Bones: Investigation of Sakurako', 3, 5, 1, 1977, 50, '"Beautiful Bones: Investigation of Sakurako" is a mystery series
centered around high school student Shoutarou Tatewaki and the enigmatic forensic anthropologist Sakurako Kujo. Together, they investigate various skeletal
remains, uncovering dark secrets and solving intriguing mysteries along the way.', 4.7, 400, 200,
'images/book_image/Sakurako.webp');

-- Romance
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (12.99, 'Pride and Prejudice', 4, 4, 1, 1813, 40, '"Pride and Prejudice" is a classic romance novel revolving around the Bennet familys five daughters
and their pursuit of love and marriage in 19th-century England. The spirited Elizabeth Bennet clashes with the proud Mr. Darcy, leading to misunderstandings and
unexpected romance amidst societal expectations and class distinctions.', 4.8, 500, 250,
'images/book_image/Pride and Prejudice.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (11.99, 'The Notebook', 4, 4, 1, 1996, 40, 'A heartwarming tale of love and devotion, "The Notebook" follows the enduring romance between Noah and Allie,
who confront societal pressures and personal obstacles to be together. Set against the backdrop of the South in the 1940s, their love story transcends time,
inspiring readers with its poignant message of true love.', 4.4, 350, 180,
'images/book_image/TheNotebook.webp');

-- Fantasy
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (29.99, 'The Hobbit', 5, 6, 1, 1937, 70, '"The Hobbit" chronicles the adventure of Bilbo Baggins, a hobbit who embarks on a journey to reclaim a treasure
guarded by the dragon Smaug. Along the way, he encounters trolls, elves, and goblins, ultimately discovering courage and friendship.', 4.9, 600, 300,
'images/book_image/TheHobbit.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (28.99, 'Harry Potter and the Chamber of Secrets', 5, 6, 1, 1998, 80, 'In "Harry Potter and the Chamber of Secrets," Harry returns to Hogwarts for his
second year, where mysterious happenings terrorize the school. With the help of his friends Ron and Hermione, Harry uncovers the truth behind the Chamber of
Secrets.', 4.8, 400, 200,
'images/book_image/HarryPorter.webp');


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- Mega World

-- Science
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (18.99, 'A Brief History of Time', 1, 3, 2, 1988, 50, '"A Brief History of Time" explores the mysteries of the universe, discussing concepts such as black
holes, the Big Bang, and the nature of time. Written for a general audience, it offers insights into the complexities of theoretical physics in a clear
and accessible manner.', 4.5, 200, 100,
'images/book_image/BriefHistoryOfTime.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (19.99, 'Cosmos', 1, 1, 2, 1980, 60, '"Cosmos" is a captivating exploration of the universe, delving into topics like the origin of life, evolution, and
the vastness of space. Through engaging narratives and stunning visuals, it inspires wonder and curiosity about the cosmos and
our place within it.', 4.8, 300, 150,
'images/book_image/Cosmos.webp');

-- Mystery
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (15.99, 'The Girl with the Dragon Tattoo', 2, 2, 2, 2005, 70, '"The Girl with the Dragon Tattoo" is a gripping thriller revolving around
journalist Mikael Blomkvist and hacker Lisbeth Salander as they investigate a decades-old disappearance. Their quest unveils dark secrets, corruption,
and a shocking conspiracy.', 4.6, 300, 150,
'images/book_image/The girl with the dragon tattoo.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (22.99, 'The Girl on the Train', 2, 6, 2, 2015, 70, '"The Girl on the Train" is a psychological thriller centered around Rachel Watson,
who becomes entangled in a missing persons investigation. As she unravels the truth, she confronts her own troubled past and discovers shocking
revelations about those around her.', 4.8, 300, 150,
'images/book_image/The Girl on the Train.webp');

-- Light Novel


-- Romance
--INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
--VALUES (11.99, 'Pride and Prejudice', 4, 4, 2, 1813, 40, '"Pride and Prejudice" is a timeless romance following the Bennet
--sisters as they navigate love and societal expectations in 19th-century England. Elizabeth Bennets spirited nature clashes
--with the proud Mr. Darcy, leading to misunderstandings and eventual romance.', 4.8, 350, 180,
--'image_url');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (14.99, 'Outlander', 4, 4, 2, 1996, 50, '"Outlander" is a captivating tale of time travel and romance, where WWII nurse Claire Randall is transported back
to 18th-century Scotland. Amidst political intrigue and danger, she finds love with Highland warrior Jamie Fraser, testing her loyalty and altering
the course of history.', 4.5, 300, 150,
'images/book_image/Outlander.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (12.99, 'Eleanor & Park', 4, 4, 2, 2013, 50, '"Eleanor & Park" is a heartwarming young adult romance about two misfit teenagers who find solace in
each others company. Set in the 1980s, their unlikely love story explores themes of friendship, family, and the power of acceptance.', 4.7, 300, 150,
'images/book_image/Eleanor & Park.webp');

-- Fantasy
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (28.99, 'Mistborn: The Final Empire', 5, 6, 2, 2006, 80, '"Mistborn: The Final Empire" is an epic fantasy novel set in a world ruled by
a tyrannical immortal emperor. A band of rebels, including the street urchin Vin, seeks to overthrow him using their unique magical abilities
and daring heists.', 4.7, 400, 200,
'images/book_image/Mistborn-The Final Empire.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (26.99, 'A Game of Thrones', 5, 6, 2, 1996, 70, '"A Game of Thrones" is a gripping fantasy novel set in the fictional continents of Westeros and
Essos. It follows the power struggles among noble families as they vie for control of the Iron Throne. Intrigue, betrayal, and epic battles unfold
amidst supernatural threats and political machinations.', 4.8, 600, 300,
'images/book_image/A Game of Thrones.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image]) 
VALUES (29.99, 'The Name of the Wind', 5, 6, 2, 2007, 80, '"The Name of the Wind" is a captivating fantasy novel that chronicles the life of Kvothe,
a gifted young musician and magician. Through his own narration, Kvothe recounts his journey from a talented but impoverished child to a legendary
figure known for his remarkable adventures and exploits.', 4.7, 700, 350,
'images/book_image/The Name of the Wind.webp');


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- IPM

-- Science Fiction
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (19.99, 'The Martian', 1, 3, 3, 2011, 50, '"The Martian" is a riveting science fiction novel that follows astronaut Mark Watneys struggle for survival
after being stranded on Mars. Using his ingenuity and resourcefulness, Watney must find a way to signal Earth and survive the harsh Martian environment until
rescue arrives.', 4.7, 200, 100,
'images/book_image/The Martian.webp');

-- Mystery
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'In the Woods', 2, 2, 3, 2007, 60, '"In the Woods" is a gripping mystery novel that follows detective Rob Ryan as he investigates a
chilling murder in the Irish countryside. Haunted by his own past and the disappearance of his childhood friends, Ryan uncovers dark secrets that
threaten to unravel his sanity.', 4.5, 250, 120,
'images/book_image/In the Woods.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'Big Little Lies', 2, 2, 3, 2014, 60, '"Big Little Lies" is a compelling mystery novel set in a picturesque coastal town.
The story unfolds through the intertwined lives of three women, whose seemingly perfect lives unravel amid secrets, lies, and betrayal,
leading to a shocking climax that exposes the dark underbelly of suburbia.', 4.6, 250, 120,
'images/book_image/Big Little Lies.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'The Woman in Whites', 2, 2, 3, 2014, 60, '"The Woman in White" is a captivating Victorian-era mystery novel that follows
a young art teacher drawn into a web of intrigue and deception surrounding a mysterious woman in white. As secrets are revealed and identities uncovered,
the protagonist must navigate treacherous waters to uncover the truth and save the ones she loves.', 4.6, 250, 120,
'images/book_image/The Woman in Whites.webp');

-- Light Novel
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (21.99, 'Steins;Gate: The Cosmic Looper', 3, 5, 3, 2010, 60, '"Steins;Gate: The Cosmic Looper" is a captivating light novel that
explores themes of time travel and alternate realities. Set in modern-day Tokyo, it follows a group of eccentric scientists who discover
a way to send messages to the past, leading to unforeseen consequences and moral dilemmas as they attempt to manipulate time for their own ends.', 4.7, 250, 120,
'images/book_image/Steins-Gate- The Cosmic Looper.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'Gosick', 3, 5, 3, 2003, 50, '"Gosick" is a captivating light novel that follows the adventures of Kazuya Kujo, a transfer student at
Saint Marguerite Academy, and Victorique de Blois, a brilliant but eccentric girl with a talent for solving mysteries. Together, they unravel dark
secrets and untangle complex puzzles in a fictional European country during the early 20th century.', 4.5, 200, 100,
'images/book_image/Gosick.webp');

-- Romance
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (16.99, 'The Fault in Our Stars', 4, 4, 3, 2012, 80, '"The Fault in Our Stars" is a heartrending young adult novel that follows the poignant
love story of Hazel Grace Lancaster and Augustus Waters, two teenagers battling cancer. Their journey is marked by humor, wit, and raw emotion as
they navigate the complexities of life, love, and mortality.', 4.6, 350, 180,
'images/book_image/The Fault in Our Stars.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (16.99, 'Me Before You', 4, 4, 3, 2012, 70, '"Me Before You" is a touching romance novel that revolves around the unlikely love story between
Louisa Clark and Will Traynor. Louisa, a quirky and optimistic young woman, becomes the caregiver for Will, a cynical and wealthy quadriplegic.
Their relationship blossoms, leading to profound personal growth and heartbreaking decisions that challenge societal norms.', 4.7, 300, 150,
'images/book_image/Me Before You.webp');

-- Fantasy
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (24.99, 'The Way of Kings', 5, 6, 3, 2010, 90, '"The Way of Kings" is an epic fantasy novel set in the richly imagined world of Roshar.
It follows the intertwined journeys of various characters, including Kaladin, Shallan, and Dalinar, as they navigate a world torn apart by war and strife.
With its intricate world-building and complex characters, the novel explores themes of honor, betrayal, and the pursuit of justice.', 4.9, 400, 200,
'images/book_image/The Way of Kings.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (24.99, 'The Fellowship of the Ring', 5, 6, 3, 2010, 70, '"The Fellowship of the Ring" is a classic fantasy novel that kicks off J.R.R. Tolkiens iconic
"The Lord of the Rings" trilogy. It follows Frodo Baggins and a diverse group of companions as they embark on a perilous journey to destroy the One Ring and
thwart the dark lord Sauron. Along the way, they encounter danger, adventure, and unexpected allies in their quest to save Middle-earth from darkness.', 4.7, 300, 150,
'images/book_image/The Fellowship of the Ring.webp');


-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

-- Sakura Light Novel

-- Science
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (19.99, 'The Martian Chronicles', 1, 1, 4, 1950, 50, '"The Martian Chronicles" is a collection of interconnected science fiction stories
set on Mars. It explores themes of colonization, exploration, and the human condition as Earthlings venture to the red planet and encounter
Martian civilization. Through vivid imagery and thought-provoking narratives, the book offers a captivating portrayal of humanitys dreams and
aspirations amidst the vastness of space.', 4.6, 200, 100,
'images/book_image/The Martian Chronicles.webp');

-- Mystery
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'The Secret History', 2, 2, 4, 1992, 60, '"The Secret History" is a psychological thriller that
follows a group of eccentric students at an elite college. As they delve into the mysteries of ancient Greek culture,
their obsession with a forbidden ritual leads to a shocking murder. Told through the eyes of an outsider, the novel explores themes of guilt,
morality, and the consequences of indulging in dark desires.', 4.7, 250, 120,
'images/book_image/The Secret History.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'The Silence of the Lambs', 2, 2, 4, 1988, 60, '"The Silence of the Lambs" is a chilling psychological thriller that follows
FBI trainee Clarice Starling as she seeks the help of incarcerated cannibalistic serial killer Dr. Hannibal Lecter to catch another serial killer,
Buffalo Bill. As Clarice delves deeper into the minds of both killers, she finds herself entangled in a dangerous game of cat and mouse that pushes
her to her limits.', 4.7, 250, 120,
'images/book_image/The Silence of the Lambs.webp');

-- Light Novel
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'Your Lie in April', 3, 5, 4, 2011, 40, '"Your Lie in April" is a poignant light novel that follows the story of Kousei Arima, a former
child prodigy pianist who lost the ability to hear the sound of his own music after his mothers death.
Through the introduction of a spirited violinist named Kaori Miyazono, Kousei rediscovers his passion for music and
embarks on a journey of healing, love, and self-discovery.', 4.8, 300, 150,
'images/book_image/Your Lie in April.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (20.99, 'Moriarty the Patriot', 3, 5, 4, 2016, 130, '"Moriarty the Patriot" is a captivating light novel that reimagines the iconic character
of Professor James Moriarty from the Sherlock Holmes stories as a charismatic anti-hero. Set in Victorian England, the series follows Moriartys quest
for justice and his pursuit of a better society through cunning schemes and meticulous planning, all while challenging the
conventions of his time.', 4.2, 300, 100,
'images/book_image/MoriartyThePatriot.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (15.99, '86 -Eighty Six-', 3, 5, 4, 2016, 200, '"86 -Eighty Six-" is a compelling light novel set in a dystopian world where the elite Alba
race oppresses the minority 86th district. The story follows the struggles of a group of 86ers, led by the enigmatic Shin, as they fight against
discrimination and injustice while piloting unmanned drones in a war against an unknown enemy.', 4.5, 200, 100,
'images/book_image/86.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (15.99, 'Zaregoto', 3, 5, 4, 2002, 80, '"Zaregoto" is a captivating light novel series that revolves around the mysterious protagonist
Ii-chan and his involvement in a series of intricate and enigmatic murders. Set on a secluded island, the story explores themes of identity,
morality, and the complexity of human relationships amidst a backdrop of surreal and suspenseful mysteries.', 4.6, 200, 100,
'images/book_image/zaregoto.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (18.99, 'Violet Evergarden', 3, 5, 4, 2015, 200, '"Violet Evergarden" is a captivating light novel series that follows
the journey of Violet, a former child soldier who becomes an Auto Memory Doll, tasked with ghostwriting letters for those unable
to express their emotions. Through her encounters with various clients, Violet embarks on a personal journey of self-discovery and
understanding of human emotions.', 4.7, 200, 100,
'images/book_image/Violet Evergarden.webp');

-- Romance


-- Fantasy
INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (21.99, 'The Bone Clocks', 5, 6, 4, 2014, 270, '"The Bone Clocks" is a spellbinding fantasy novel that spans decades, weaving together the lives of
diverse characters. It delves into themes of magic, immortality, and the eternal struggle between good and evil, offering readers a captivating
journey through a world where the ordinary intersects with the extraordinary.', 4.9, 400, 200,
'images/book_image/The Bone Clocks.webp');

INSERT INTO Book (Price, Title, Category_ID, Author_ID, Publisher_ID, Year_of_Publication, Quantity, Description, Rate, Rate_Count, Sold, [Image])
VALUES (25.99, 'A Song of Ice and Fire', 5, 6, 4, 1996, 300, '"A Song of Ice and Fire" is an epic fantasy series that unfolds
in the fictional continents of Westeros and Essos. It intricately weaves together the complex web of political intrigue, power struggles, and
supernatural elements, revolving around noble families vying for control of the Iron Throne. With its richly developed world and diverse cast of characters,
the series captivates readers with its sprawling scope and gripping narrative.', 4.9, 400, 200,
'images/book_image/A Song of Ice and Fire.webp');

-- Additional books can be added similarly.
