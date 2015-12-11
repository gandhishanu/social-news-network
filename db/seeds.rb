# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#$("#grid li").each(function(){console.log('<token1>' + $(this).find("h4").text() + '<token2>' + $(this).find("img").attr("src") + "<token3>" + $(this).find("p").text())})

categories = [{:name=>'Politics', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442266382yrizaffopt.jpg', :description=>'Check out our hot news from politics. We are here to inform you about everything, wherever you are, whatever your age.'},
              {:name=>'Business', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301546alfopt.jpg', :description=>'Business publication. business news, trends and profiles. Read our articles and inform about latest trends.'},
              {:name=>'Technology', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442266476ci.jpg', :description=>'Latest news from tech, be in contact with us.'},
              {:name=>'Entertainment', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442265344girl11opt.jpg', :description=>'Entertainment news, celebrities, celeb news, and celebrity gossip. Check out the hottest fashion, photos, movies.'},
              {:name=>'Media', :thumbnail=>'http://31.media.tumblr.com/tumblr_lvh3okJPqZ1qa0o0mo1_250.gif', :description=>'Media news, opinion and analysis. Be in contact with us!'},
              {:name=>'Celebrities', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442266120ustin-bieber-pug.jpg', :description=>'Get the latest celebrity news and hot celeb gossip with exclusive stories and pictures about them.'},
              {:name=>'Sport', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301819ptopt.jpg', :description=>' Be in contact with us and follow latest sport events!'},
              {:name=>'Fun', :thumbnail=>'http://images.huffingtonpost.com/2015-10-13-1444756294-3245772-IMG_2906-thumb.JPG', :description=>'Funny, weird news… Be in contact with us and find out latest news...'},
              {:name=>'Travel', :thumbnail=>'http://buzzybuzz.net/img/noimage.jpg', :description=>'Search most famous destination all over the world with us...'},
              {:name=>'History', :thumbnail=>'http://buzzybuzz.net/img/noimage.jpg', :description=>'Check out interesting history facts...'},
              {:name=>'Environment', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301072popt.jpg', :description=>'Check out lates news from environment...'},
              {:name=>'Lifestyle', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442299690tinder-betaopt.jpg', :description=>'Check out the best lifestyle news that we offer'},
              {:name=>'Chronics', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442300587malopt.jpg', :description=>'Check out latest and dramatic news'},
              {:name=>'Art', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442298994us-picasso.jpg', :description=>'Best art news from all over the world'},
              {:name=>'Education', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442265539mt.jpg', :description=>'Education with us - best solution for you'},
              {:name=>'Animals', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442487917lincoln.jpg', :description=>'world of animals'}]

categories.each do |category|
  Category.create!(category)
end

posts = [{:category_id=>1, :title=>'Petition To Rename Australian Currency', :thumbnail=>'http://31.media.tumblr.com/tumblr_lvh3okJPqZ1qa0o0mo1_250.gif', :body=>'An online petition is calling on the Australian government to rename their currency based on a joke from a 1995 episode of The Simpsons.Al...'},
         {:category_id=>2, :title=>'Halloween Then Vs Halloween Now 1', :thumbnail=>'http://images.huffingtonpost.com/2015-10-13-1444756294-3245772-IMG_2906-thumb.JPG', :body=>'Halloween is like a thing now. When I was a kid? It was a thing. But like a really crap thing? It was more aimed at teens that would come and ...'},
         {:category_id=>3, :title=>'The Name of the Windy – DORK TOWER 04.08.15', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442838982fgf.jpg', :body=>'Full comic here...											...'},
         {:category_id=>4, :title=>'Workbooks.com', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442754303maxresdefau.jpg', :body=>'At first, Workbooks.com customer database software isnt easy to use. This is because the program has been designed to work similarly to the W...'},
         {:category_id=>5, :title=>'Fire Crews Investigate Reports Of Explosion', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442753702tear-gas.jpg', :body=>'Emergency services are at the scene of a house fire in Derbyshire amid reports of a possible explosion, police say.											...'},
         {:category_id=>6, :title=>'US, China discuss deal to limit use of cyberweapons, says report', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442736102obamaxis.jpg', :body=>'The countries are in talks to prohibit first strikes against critical infrastructure, according to The New York Times. The negotiations could ...'},
         {:category_id=>7, :title=>'Jackie Collins, doyenne of the steamy Hollywood novel, dies at 77', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442735281Jackie_Collin.jpg', :body=>'LOS ANGELES (Reuters) - Jackie Collins, the best-selling author of dozens of steamy novels who depicted the boardrooms and bedrooms of Hollywood...'},
         {:category_id=>8, :title=>'Nokia E62 for Cingular', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442489737cap7.jpg', :body=>'Are smart phones ready for the masses?											...'},
         {:category_id=>9, :title=>'Lincoln the mixed breed', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442487917lincoln.jpg', :body=>'This is Lincoln. I adopted him from the SPCA in Aiken, South Carolina, where I was told he was a boxer mix. Upon a recent vet visit he became ...'},
         {:category_id=>10, :title=>'H&Ms Latest Fashion Campaign Close The Loop Features A Brilliantly Diverse Array Of Models', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442386946mypicture.jpg', :body=>'H&M has proudly acknowledged the diverse groups of people in the world in their latest fashion campaign....'},
         {:category_id=>11, :title=>'Feminism Needs to Stop Isolating Females', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442386157hooded.jpg', :body=>'Your students union may have tried to convince you otherwise, but burning your bra and refusing to shave your armpits doesnt make you a femi...'},
         {:category_id=>12, :title=>'iPhone stops bullet during mugging', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442265254phone23opt.jpg', :body=>'Technically Incorrect: Police say a student at Fresno State was being robbed when his assailant fired at him and his iPhone came to the rescue...'},
         {:category_id=>13, :title=>'Majority Of UK Voters Back Exit From EU - Poll', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442265416ukopt.jpg', :body=>'A survey shows the EU ...'},
         {:category_id=>14, :title=>'Michel Thomas Method', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442265539mt.jpg', :body=>'Until he passed in 2005, world famous linguist and language teacher Michel Thomas taught languages to Hollywood stars, politicians and corpora...'},
         {:category_id=>15, :title=>'Russia may be escalating military role in Syria', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442265856sopt.jpg', :body=>'Source: www.latimes.com - Friday, September 04, 2015 - U.S. intelligence has captured evidence of a significant escalation of Russias militar...'},
         {:category_id=>16, :title=>'OC Radio Host Stumps Trump With Series Of Foreign Policy Questions', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442265944pt.jpg', :body=>'Source: losangeles.cbslocal.com - Friday, September 04, 2015ORANGE (CBSLA.com) — A little less than two weeks before he is scheduled to visi...'},
         {:category_id=>1, :title=>'Doug the Pug lives like Justin Bieber for the day', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442266120ustin-bieber-pug.jpg', :body=>'Famous Internet dog Doug the Pug lives a more pampered life than most pups, but all of his fame and Facebook likes are minuscule in comparison to the celeb...'},
         {:category_id=>2, :title=>'Rovio to lay off one-third of its staff', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442266283env.jpg', :body=>'Rovio Entertainment is about to lay off over one-third of its staff....'},
         {:category_id=>3, :title=>'Greeces Syriza to win election but face setback, polls show', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442266382yrizaffopt.jpg', :body=>'Former Greek Prime Minister Alexis Tsipras leftist Syriza will emerge as the biggest party in next months election ...'},
         {:category_id=>4, :title=>'2014-15 Chevy Impala recalled over airbag fault', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442266476ci.jpg', :body=>'Over 5,700 current-generation Chevrolet Impala sedans are being recalled, General Motors announced today. The fullsize four-doors suffer from an issue with...'},
         {:category_id=>5, :title=>'Hacking HR: From Jams to the LinkedIn HR Hackathon', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442298746lklopt.jpg', :body=>'Hackathon: Bringing the outside World inside to Solve HR Issues Peter Capelli’s article Why We Love To Hate HR And What We Can Do About It i...'},
         {:category_id=>6, :title=>'U.S. returns stolen Picasso painting', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442298994us-picasso.jpg', :body=>'WASHINGTON (Reuters) - U.S. authorities returned the stolen $15 million Picasso painting ...'},
         {:category_id=>7, :title=>'What All of Those Confusing Dress Code Terms Really Mean', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442299082dc.jpg', :body=>'Dress codes are everywhere: work, conferences, weddings, birthday parties, cocktail parties, etc. Unfortunately, not all of us are so fashion-inclined to k...'},
         {:category_id=>8, :title=>'Is on-demand dating a Tinder killer?', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442299690tinder-betaopt.jpg', :body=>'A $2 billion industry as of 2014 with a growth rate of 5% yearly, online dating is catering to an increasingly cynical, time-starved single adult who is ti...'},
         {:category_id=>9, :title=>'Drought-fed wildfires continue to blaze in Pacific Northwest', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442299772fireopt.jpg', :body=>'Firefighters are continuing to battle wildfires fed by drought in the northwest United States.										...'},
         {:category_id=>10, :title=>'Belgrade: Medical Examination Provided For Migrant Children', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442300495refugeesopt.jpg', :body=>'Aid and medical examinations have been provided for migrants located in the park near Belgrade’s main station for some time now, primarily for children....'},
         {:category_id=>11, :title=>'Missing Indonesian plane with 54 found crashed', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442300587malopt.jpg', :body=>'An aircraft with 54 people on board crashed in Indonesias remote and mountainous region of Papua on Sunday, a government official said, the l...'},
         {:category_id=>12, :title=>'China Tianjin explosions: Nearly 100 people still missing', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442300676feuer3opt.jpg', :body=>'Ninety-five people, 85 of them firefighters, are still missing four days after multiple blasts in the north-eastern port of Tianjin, Chinese authorities ha...'},
         {:category_id=>13, :title=>'Brazil: Overnight shooting spree kills 18 in Sao Paulo', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442300820brazopt.jpg', :body=>'Gunmen have killed at least 18 people on the outskirts of Brazils largest city, Sao Paulo, in a series of overnight attacks....'},
         {:category_id=>14, :title=>'Putin rewards excellence’ in human rights', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442300921putin23.jpg', :body=>'Vladimir Putin is set to institute a new state award for excellence in the field of human rights, despite a Russian crackdown on independent activists...'},
         {:category_id=>15, :title=>'Europe migrant crisis: Dozens die in hold of Libya boat', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301006Dozens.jpg', :body=>'At least 40 migrants have died in an overcrowded boat in the Mediterranean, the Italian navy has said....'},
         {:category_id=>16, :title=>'‘Out of control’ fire threatens Swedish town', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301072popt.jpg', :body=>'A huge fire is threatening to destroy the historic wooden town of Eksjö in Jönköping county in southern Sweden. One woman has died in the fire....'},
         {:category_id=>1, :title=>'Use Quick Look on Mac to Preview Live Websites', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301234pleopt.jpg', :body=>'Quick Look however isn’t just an option for previewing local files, it can also display live websites without you having to open the web browser. 							...'},
         {:category_id=>2, :title=>'5 Animation Shorts Guaranteed to Brighten Up Your Day', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301273shrek800opt.jpg', :body=>'Fifteen-second animations to brighten up your day and remind you that its the simple things in life that mean the most -- and that its the simple things ...'},
         {:category_id=>3, :title=>'Some of London most iconic buildings are opening their doors to the public', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301367lond.jpg', :body=>'10 Downing Street and the BT Tower are among the highlights, while skyscrapers, mausoleums and even a sliced up boat will be welcoming visitors on Saturday...'},
         {:category_id=>4, :title=>'Why did Google create Alphabet? Listen to our analysis', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301546alfopt.jpg', :body=>'The news of Googles new parent company had the whole tech world abuzz, with many asking what the move says about the future of Google and its various ente...'},
         {:category_id=>5, :title=>'Video: John Roderick on String Art Owls, Copper Pipe, and Bono', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301631ropt00.jpg', :body=>'Long story (not very) short? One night in 2003--after killing it in front of audience of about 30 lucky people in Oakland--The Long Winters needed a place ...'},
         {:category_id=>6, :title=>'Instapaper 4: Deciding to Read', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301709insta112opt.jpg', :body=>'The lede here is that my pal, Marco, has just released the stellar new 4.0 version of his Instapaper suite.											...'},
         {:category_id=>7, :title=>'The best cosplay from the League of Legends Oceania grand final', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301777pcmp.jpg', :body=>'The multiplayer online game League of Legends took over Sydneys Luna Park on Saturday for the Oceanic Pro League grand final.											...'},
         {:category_id=>8, :title=>'Partizan crushes Steaua 4 -2', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301819ptopt.jpg', :body=>'The Partizan football club managed to reach the UEFA Champions League play-off after defeating Bucharest’s Steaua 4-2 ...'},
         {:category_id=>9, :title=>'Tourism boom drives Japan to convert offices into hotels', :thumbnail=>'http://buzzybuzz.net/img/thumbnails/1442301928jap11.jpg', :body=>'Record tourists to Japan are stretching the ability of hotels to accommodate them in a sector constrained by high costs, forcing developers to think out of...'}]

posts.each do |post|
  Post.create!(post)
end


users = [{name: "Ali", email: "ali@uiowa.edu", password: "abcdef", email_confirmed: "t", session_token: SecureRandom.urlsafe_base64},
         {name: "John", email: "john@uiowa.edu", password: "abcdef", email_confirmed: "t", session_token: SecureRandom.urlsafe_base64},
         {name: "Sam", email: "sam@uiowa.edu", password: "abcdef", email_confirmed: "t", session_token: SecureRandom.urlsafe_base64},
         {name: "Raj", email: "raj@uiowa.edu", password: "abcdef", email_confirmed: "t", session_token: SecureRandom.urlsafe_base64}]

users.each do |user|
  User.create!(user)
end


votes = [{updown_cd: 0, user_id: 1, post_id: 1},
         {updown_cd: 0, user_id: 1, post_id: 2},
         {updown_cd: 1, user_id: 1, post_id: 3},
         {updown_cd: 1, user_id: 1, post_id: 4}]

votes.each do |vote|
  Vote.create!(vote)
end

comments = [{user_id: 1, post_id: 1, body: "Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus."},
            {user_id: 1, post_id: 1, body: "Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus."},
            {user_id: 1, post_id: 1, body: "This is a small comment"},
            {user_id: 1, post_id: 1, body: "Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus."},
            {user_id: 1, post_id: 1, body: "Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus."},
            {user_id: 1, post_id: 1, body: "Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus."},
            {user_id: 3, post_id: 1, comment_id: 1, body: "this is a reply"},
            {user_id: 4, post_id: 1, comment_id: 7, body: "this is reply of your reply Sam..."},]

comments.each do |comment|
  Comment.create!(comment)
end

relateds = [{post_id1: 1, post_id2: 2, frequency: 1},
            {post_id1: 1, post_id2: 3, frequency: 1},
            {post_id1: 1, post_id2: 4, frequency: 1},
            {post_id1: 2, post_id2: 5, frequency: 1},
            {post_id1: 2, post_id2: 6, frequency: 1},
            {post_id1: 2, post_id2: 7, frequency: 1},
            {post_id1: 2, post_id2: 8, frequency: 1},
            {post_id1: 3, post_id2: 9, frequency: 1}]

relateds.each do |related|
  Related.create!(related)
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

