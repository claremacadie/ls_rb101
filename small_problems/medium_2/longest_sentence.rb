# longest_sentence.rb

def create_sentence_array(paragraph)
  no_fullstop = paragraph.split('.')
  no_fullstop.map! { |sentence| sentence + '.' }

  no_questionmark = no_fullstop.map { |i| i.split('?') }.flatten

  no_questionmark.map! do |sentence|
    if sentence[-1] != '.'
      sentence + '?'
    else
      sentence
    end
  end

  no_exclamationmark = no_questionmark.map { |i| i.split('!') }.flatten
  no_exclamationmark.map! do |sentence|
    if sentence[-1] != '.' && sentence[-1] != '?'
      sentence + '!'
    else
      sentence
    end
  end
  no_exclamationmark
end

def longest_sentence(paragraph)
  sentence_array = create_sentence_array(paragraph)

  count_words = sentence_array.each_with_object([]) do |sentence, arr|
    word_array = sentence.split
    arr << word_array.size
  end
  hash = {}
  count_words.each_with_index do |count, i|
    hash[count] = sentence_array[i]
  end
  puts "Max words = #{hash.keys.max}"
  puts hash.fetch(hash.keys.max)
end

test = "Hello, there you are? Wow! Come back here. Come on! Please?"
longest_sentence(test)

paragraph = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

longest_sentence(paragraph)

book ="Project Gutenberg's Frankenstein, by Mary Wollstonecraft (Godwin) Shelley

This eBook is for the use of anyone anywhere at no cost and with
almost no restrictions whatsoever.  You may copy it, give it away or
re-use it under the terms of the Project Gutenberg License included
with this eBook or online at www.gutenberg.net


Title: Frankenstein
       or The Modern Prometheus

Author: Mary Wollstonecraft (Godwin) Shelley

Release Date: June 17, 2008 [EBook #84]

Language: English


*** START OF THIS PROJECT GUTENBERG EBOOK FRANKENSTEIN ***




Produced by Judith Boss, Christy Phillips, Lynn Hanninen,
and David Meltzer. HTML version by Al Haines.










Frankenstein,

or the Modern Prometheus


by

Mary Wollstonecraft (Godwin) Shelley




Letter 1


St. Petersburgh, Dec. 11th, 17--

TO Mrs. Saville, England

You will rejoice to hear that no disaster has accompanied the
commencement of an enterprise which you have regarded with such evil
forebodings.  I arrived here yesterday, and my first task is to assure
my dear sister of my welfare and increasing confidence in the success
of my undertaking.

I am already far north of London, and as I walk in the streets of
Petersburgh, I feel a cold northern breeze play upon my cheeks, which
braces my nerves and fills me with delight.  Do you understand this
feeling?  This breeze, which has travelled from the regions towards
which I am advancing, gives me a foretaste of those icy climes.
Inspirited by this wind of promise, my daydreams become more fervent
and vivid.  I try in vain to be persuaded that the pole is the seat of
frost and desolation; it ever presents itself to my imagination as the
region of beauty and delight.  There, Margaret, the sun is forever
visible, its broad disk just skirting the horizon and diffusing a
perpetual splendour.  There--for with your leave, my sister, I will put
some trust in preceding navigators--there snow and frost are banished;
and, sailing over a calm sea, we may be wafted to a land surpassing in
wonders and in beauty every region hitherto discovered on the habitable
globe.  Its productions and features may be without example, as the
phenomena of the heavenly bodies undoubtedly are in those undiscovered
solitudes.  What may not be expected in a country of eternal light?  I
may there discover the wondrous power which attracts the needle and may
regulate a thousand celestial observations that require only this
voyage to render their seeming eccentricities consistent forever.  I
shall satiate my ardent curiosity with the sight of a part of the world
never before visited, and may tread a land never before imprinted by
the foot of man. These are my enticements, and they are sufficient to
conquer all fear of danger or death and to induce me to commence this
laborious voyage with the joy a child feels when he embarks in a little
boat, with his holiday mates, on an expedition of discovery up his
native river. But supposing all these conjectures to be false, you
cannot contest the inestimable benefit which I shall confer on all
mankind, to the last generation, by discovering a passage near the pole
to those countries, to reach which at present so many months are
requisite; or by ascertaining the secret of the magnet, which, if at
all possible, can only be effected by an undertaking such as mine.

These reflections have dispelled the agitation with which I began my
letter, and I feel my heart glow with an enthusiasm which elevates me
to heaven, for nothing contributes so much to tranquillize the mind as
a steady purpose--a point on which the soul may fix its intellectual
eye.  This expedition has been the favourite dream of my early years. I
have read with ardour the accounts of the various voyages which have
been made in the prospect of arriving at the North Pacific Ocean
through the seas which surround the pole.  You may remember that a
history of all the voyages made for purposes of discovery composed the
whole of our good Uncle Thomas' library.  My education was neglected,
yet I was passionately fond of reading.  These volumes were my study
day and night, and my familiarity with them increased that regret which
I had felt, as a child, on learning that my father's dying injunction
had forbidden my uncle to allow me to embark in a seafaring life.

These visions faded when I perused, for the first time, those poets
whose effusions entranced my soul and lifted it to heaven.  I also
became a poet and for one year lived in a paradise of my own creation;
I imagined that I also might obtain a niche in the temple where the
names of Homer and Shakespeare are consecrated.  You are well
acquainted with my failure and how heavily I bore the disappointment.
But just at that time I inherited the fortune of my cousin, and my
thoughts were turned into the channel of their earlier bent.

Six years have passed since I resolved on my present undertaking.  I
can, even now, remember the hour from which I dedicated myself to this
great enterprise.  I commenced by inuring my body to hardship.  I
accompanied the whale-fishers on several expeditions to the North Sea;
I voluntarily endured cold, famine, thirst, and want of sleep; I often
worked harder than the common sailors during the day and devoted my
nights to the study of mathematics, the theory of medicine, and those
branches of physical science from which a naval adventurer might derive
the greatest practical advantage.  Twice I actually hired myself as an
under-mate in a Greenland whaler, and acquitted myself to admiration. I
must own I felt a little proud when my captain offered me the second
dignity in the vessel and entreated me to remain with the greatest
earnestness, so valuable did he consider my services.  And now, dear
Margaret, do I not deserve to accomplish some great purpose?  My life
might have been passed in ease and luxury, but I preferred glory to
every enticement that wealth placed in my path.  Oh, that some
encouraging voice would answer in the affirmative!  My courage and my
resolution is firm; but my hopes fluctuate, and my spirits are often
depressed.  I am about to proceed on a long and difficult voyage, the
emergencies of which will demand all my fortitude:  I am required not
only to raise the spirits of others, but sometimes to sustain my own,
when theirs are failing.

This is the most favourable period for travelling in Russia.  They fly
quickly over the snow in their sledges; the motion is pleasant, and, in
my opinion, far more agreeable than that of an English stagecoach.  The
cold is not excessive, if you are wrapped in furs--a dress which I have
already adopted, for there is a great difference between walking the
deck and remaining seated motionless for hours, when no exercise
prevents the blood from actually freezing in your veins.  I have no
ambition to lose my life on the post-road between St. Petersburgh and
Archangel. I shall depart for the latter town in a fortnight or three
weeks; and my intention is to hire a ship there, which can easily be
done by paying the insurance for the owner, and to engage as many
sailors as I think necessary among those who are accustomed to the
whale-fishing.  I do not intend to sail until the month of June; and
when shall I return?  Ah, dear sister, how can I answer this question?
If I succeed, many, many months, perhaps years, will pass before you
and I may meet.  If I fail, you will see me again soon, or never.
Farewell, my dear, excellent Margaret. Heaven shower down blessings on
you, and save me, that I may again and again testify my gratitude for
all your love and kindness.

Your affectionate brother,
  R. Walton



Letter 2


Archangel, 28th March, 17--

To Mrs. Saville, England

How slowly the time passes here, encompassed as I am by frost and snow!
Yet a second step is taken towards my enterprise.  I have hired a
vessel and am occupied in collecting my sailors; those whom I have
already engaged appear to be men on whom I can depend and are certainly
possessed of dauntless courage.

But I have one want which I have never yet been able to satisfy, and
the absence of the object of which I now feel as a most severe evil, I
have no friend, Margaret:  when I am glowing with the enthusiasm of
success, there will be none to participate my joy; if I am assailed by
disappointment, no one will endeavour to sustain me in dejection. I
shall commit my thoughts to paper, it is true; but that is a poor
medium for the communication of feeling.  I desire the company of a man
who could sympathize with me, whose eyes would reply to mine. You may
deem me romantic, my dear sister, but I bitterly feel the want of a
friend.  I have no one near me, gentle yet courageous, possessed of a
cultivated as well as of a capacious mind, whose tastes are like my
own, to approve or amend my plans.  How would such a friend repair the
faults of your poor brother!  I am too ardent in execution and too
impatient of difficulties.  But it is a still greater evil to me that I
am self-educated:  for the first fourteen years of my life I ran wild
on a common and read nothing but our Uncle Thomas' books of voyages. At
that age I became acquainted with the celebrated poets of our own
country; but it was only when it had ceased to be in my power to derive
its most important benefits from such a conviction that I perceived the
necessity of becoming acquainted with more languages than that of my
native country.  Now I am twenty-eight and am in reality more
illiterate than many schoolboys of fifteen.  It is true that I have
thought more and that my daydreams are more extended and magnificent,
but they want (as the painters call it) KEEPING; and I greatly need a
friend who would have sense enough not to despise me as romantic, and
affection enough for me to endeavour to regulate my mind.  Well, these
are useless complaints; I shall certainly find no friend on the wide
ocean, nor even here in Archangel, among merchants and seamen.  Yet
some feelings, unallied to the dross of human nature, beat even in
these rugged bosoms.  My lieutenant, for instance, is a man of
wonderful courage and enterprise; he is madly desirous of glory, or
rather, to word my phrase more characteristically, of advancement in
his profession.  He is an Englishman, and in the midst of national and
professional prejudices, unsoftened by cultivation, retains some of the
noblest endowments of humanity.  I first became acquainted with him on
board a whale vessel; finding that he was unemployed in this city, I
easily engaged him to assist in my enterprise.  The master is a person
of an excellent disposition and is remarkable in the ship for his
gentleness and the mildness of his discipline.  This circumstance,
added to his well-known integrity and dauntless courage, made me very
desirous to engage him.  A youth passed in solitude, my best years
spent under your gentle and feminine fosterage, has so refined the
groundwork of my character that I cannot overcome an intense distaste
to the usual brutality exercised on board ship:  I have never believed
it to be necessary, and when I heard of a mariner equally noted for his
kindliness of heart and the respect and obedience paid to him by his
crew, I felt myself peculiarly fortunate in being able to secure his
services.  I heard of him first in rather a romantic manner, from a
lady who owes to him the happiness of her life.  This, briefly, is his
story.  Some years ago he loved a young Russian lady of moderate
fortune, and having amassed a considerable sum in prize-money, the
father of the girl consented to the match.  He saw his mistress once
before the destined ceremony; but she was bathed in tears, and throwing
herself at his feet, entreated him to spare her, confessing at the same
time that she loved another, but that he was poor, and that her father
would never consent to the union.  My generous friend reassured the
suppliant, and on being informed of the name of her lover, instantly
abandoned his pursuit.  He had already bought a farm with his money, on
which he had designed to pass the remainder of his life; but he
bestowed the whole on his rival, together with the remains of his
prize-money to purchase stock, and then himself solicited the young
woman's father to consent to her marriage with her lover.  But the old
man decidedly refused, thinking himself bound in honour to my friend,
who, when he found the father inexorable, quitted his country, nor
returned until he heard that his former mistress was married according
to her inclinations."

longest_sentence(book)
