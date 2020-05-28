import "../models/appException.dart";
import "package:flutter/material.dart";
import "../models/subProductDetail.dart";
import "package:flutter/foundation.dart";
import "../helpers/constants/errorMessage.dart";

class SubProductDetailProvider with ChangeNotifier {
  List<SubProductDetail> _dummyList = [
    SubProductDetail(
      id: "1274c67c-340b-4915-9829-6839f033fee7",
      name: "Ikoria: Lair of Behemoths Bundle",
      subProductId: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      subProductTypeId: "b9485923-4978-4bc4-b45f-1fa45f17e7ba",
      quantity: 4,
      price: 35.93,
      description: "The Ikoria: Lair of Behemoths (IKO) Bundle comes factory sealed with 10 booster packs and accessories—a great gift for any Magic player. You’ll be ready to play with 20 basic lands, 20 foil basic lands, 1 alternate-art promo card, a reusable storage box, keyword counter punchouts, and one oversized life counter on top of your booster packs. Befriend your perfect monster companion—if you meet their conditions, they’ll come to your aid from outside the battle! The Companion mechanic will feel familiar to Commander fans and add a fresh twist to two-player formats. Battle your way through the plane of Ikoria with monster-themed mechanics like Mutate—stack your creature cards for a mutated monster with the type of one and the abilities of another. It’s you and your monsters against the world! Team up with your powerful companions, help them grow, and crush the behemoths of Ikoria!",
      picture: Image.asset("assets/images/dummyIkoriaBundle.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "d379e011-fa49-4ee1-98d7-e600d23875df",
      name: "Ikoria: Lair of Behemoths Collector Booster",
      subProductId: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      subProductTypeId: "14ea7cf6-5bd4-4fb8-ae6c-b3509a1921b6",
      quantity: 2,
      price: 20.99,
      description: "Each Collector Booster is packed with the most premium offerings from Ikoria Lair of Behemoths – making the act of opening a booster as exciting as possible. One of the twenty commanders available in Ikoria will be featured in each booster. A Rare or Mythic extended art card can only be found in Collector Boosters. Find alternate bordered cards designed to fit within the Ikoria style or borderless Planeswalkers from the set. In this pack you get 6 Foil common uncommon or land cards 1 foil basic land card 1 foil rare or mythic card and 1 Foil double sided token",
      picture: Image.asset("assets/images/dummyIkoriaBooster.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "e706c1ea-f5a6-4aa0-b9fb-d0632ab8d5a6",
      name: "Ikoria: Lair of Behemoths (36 Booster Packs)",
      subProductId: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      subProductTypeId: "b0db13eb-2ded-4567-a0ab-d932ef9beb06",
      quantity: 3,
      price: 99.99,
      description: "The Ikoria Lair of Behemoths booster box includes 36 booster packs containing 15 cards each (540 cards in total). Inside every sealed booster display box find a foil card of a monster from the Godzilla series! Your creatures can evolve into more powerful monsters Mutated creatures keep the rules text off any/all cards they’ve mutated from so you can assemble your own combinations of abilities on creatures. Pair cards in your deck that bring their partner out and combine to make a winning strategy. This box contains enough boosters to host your own booster draft event with friends Add basic lands and then you're ready to start building decks and playing",
      picture: Image.asset("assets/images/dummyIkoriaBoosterBox1.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "c2d135bd-afcf-4c3d-9c1c-9ee4e9dcc104",
      name: "The Gathering Ikoria: Lair of Behemoths Collector Booster Box",
      subProductId: "efa4d2b2-a6e8-4f5a-92e0-535b366ad6cc",
      subProductTypeId: "b0db13eb-2ded-4567-a0ab-d932ef9beb06",
      quantity: 5,
      price: 234.37,
      description: "Collector Boosters are supercharged booster packs, loaded with nothing but the best from Ikoria: Lair of Behemoths (IKO)—alternate art, alternate frames, Commander-focused picks, and more. Experience all the beauty, wonder, and ridiculously huge monsters of Ikoria—distilled into one incredible booster. Open a pack to see some of the most beautiful and exciting cards Magic: The Gathering (MTG) has to offer. The cards of Ikoria: Lair of Behemoths (IKO) have mutated into something amazing. Open cards with alternate frames, fresh art styles, or beautiful borderless designs. Find your favorite monster companion, team up, and take on the behemoths of Ikoria together.",
      picture: Image.asset("assets/images/dummyIkoriaBoosterBox2.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "3aae383e-b34f-4564-896a-0358e9b0cb8d",
      name: "Theros Beyond Death Bundle",
      subProductId: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      subProductTypeId: "0d377553-ba41-4cf4-b117-daad960139d6",
      quantity: 2,
      price: 34.95,
      description: "Need a birthday present? A gift for the holidays? This is it. The Theros Beyond Death (THB) Bundle comes factory sealed with 10 booster packs and accessories—a great gift for any Magic player. You’ll be ready to play with 20 basic lands, 20 foil basic lands, 1 alternate-art promo card, a reusable storage box, and one oversized life counter on top of your booster packs. Play in style with full-art “Nyx” basic lands—there’s one in every pack of Theros Beyond Death (THB). Each one is a glimpse into the realm of the divine. Prepare to challenge death itself with new mechanics, new saga cards, and new gods and planeswalkers. Battle your way back from the underworld with legendary gods and destined heroes! Theros Beyond Death (THB) spins Greek mythology through the lens of Magic: The Gathering (MTG).",
      picture: Image.asset("assets/images/dummyTherosBundle.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "312cd182-29f9-4026-bcec-a6657fa66575",
      name: "Theros Beyond Death Booster Box",
      subProductId: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      subProductTypeId: "196c6b8e-fc9f-4959-91b7-06b4c0a2301a",
      quantity: 6,
      price: 97.70,
      description: "Open hundreds of cards, upgrade your deck, and shape your destiny! With 36 Theros Beyond Death (THB) booster packs, the possibilities are nearly endless. Play in style with full-art 'Nyx' basic lands—there's one in every pack of Theros Beyond Death (THB). Each one is a glimpse into the realm of the divine. Prepare to challenge death itself with new mechanics, new gods, and new planeswalkers. Crack your box and booster draft with up to 12 friends for an unforgettable game night filled with world-bending spells. Battle your way back from the underworld with legendary gods and destined heroes! Theros Beyond Death (THB) spins Greek mythology through the lens of Magic: The Gathering (MTG).",
      picture: Image.asset("assets/images/dummyTherosBoosterBox1.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "731be767-0841-47d2-9816-fb945903bcc8",
      name: "Theros Beyond Death Collector Booster Pack Display",
      subProductId: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      subProductTypeId: "196c6b8e-fc9f-4959-91b7-06b4c0a2301a",
      quantity: 4,
      price: 191.56,
      description: "The Collector Booster gives players immediate access to the coolest, most desirable cards from Theros Beyond Death.",
      picture: Image.asset("assets/images/dummyTherosBoosterBox2.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "8ce73ab9-dc05-4939-852e-eeff06d36921",
      name: "Theros Beyond Death 60-Card Starter Deck",
      subProductId: "5eb44afc-163b-4561-adf8-00ccc0ca5aa0",
      subProductTypeId: "41f9ff50-b110-45b5-922f-22000cb700a0",
      quantity: 13,
      price: 13.93,
      description: "Starter deck is ready to play right out of the box. Battle a few times to master your deck’s strategy, then open the 2 included booster packs to customize it. Play face-to-face and digital with a code to unlock the deck on Magic: The Gathering Arena. Ashiok has power to torment foes by conjuring their darkest memories, fears, and regrets. With Ashiok’s deck, you’ll fill your graveyard along with your opponent’s for massive value as you slowly drive them insane. Battle with legendary gods and destined heroes! Theros Beyond Death (THB) spins Greek mythology through the lens of Magic: The Gathering (MTG).",
      picture: Image.asset("assets/images/dummyTherosDeck.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "04f5f31f-efc0-4e5e-94f0-723a1eaa1d47",
      name: "Throne of Eldraine Bundle",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      subProductTypeId: "1010ccbb-07bf-4bf4-9bab-a5c178785aec",
      quantity: 10,
      price: 40.29,
      description: "Many paths to victory. 10 booster packs give you the variety YOU NEED to create the perfect deck. Choose your favorites, build your deck, and battle! Get more than packs: You'll be ready to play with 20 basic lands, 20 foil basic lands, 1 alternate-art foil rare card, and one oversized life counter on top of your booster packs. Build on the legends. A fresh twist on familiar stories told only the way Magic: The Gathering can. Create your own story as you battle your way to victory with your favorite fairy tale creatures! Develop your strategy. Choose your strategic focus, develop decks with different tactics, and adapt your plans on the fly As you battle your way to victory! Join the community. Magic: The Gathering (Mtg) players around the world have gathered together to play for years. Become a part of one of the largest card game communities in the world.",
      picture: Image.asset("assets/images/dummyThroneBundle.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "934c6b97-3ebc-4bf8-aff0-c7f0e9c2b266",
      name: "Throne of Eldraine Booster Box",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      subProductTypeId: "5210d982-fa30-4e28-80bc-72bd406ac9e3",
      quantity: 3,
      price: 99.94,
      description: "Expand your collection. With 36 throne of eldraine booster packs, each with 15 magic cards, The possibilities are nearly endless. Choose your favorite cards, PA your deck, and battle! These fairy tales fight back. Throne of eldraine spins grimm’s fairy tales and Arthurian legend as only Magic: The Gathering (Mtg) can. Create your own story as you battle your way to victory with your favorite fabled creatures! Devise your strategy. Plan your attack, develop new tactics, and adapt your plans on the fly As you battle your way to victory. Join the community. Magic: The Gathering (Mtg) fans have come together for decades to share their love of the game. Become a part of one of the largest gaming communities in the world. Play the game that started it all. The original strategy card game, Magic: The Gathering (Mtg) has inspired more than 20 million fans over 25 years.",
      picture: Image.asset("assets/images/dummyThroneBoosterBox.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "4b46dfd2-bd5a-4d82-a023-a734e562fa99",
      name: "Throne of Eldraine Booster",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      subProductTypeId: "02d09938-750b-4e45-b311-76b25efd2420",
      quantity: 19,
      price: 20.16,
      description: "Each collector booster is packed with the most exciting offerings from throne of eldraine, including nine foil cards, four special alternate-frame cards, and at least two rare or mythic rare cards. Collector boosters include nine foil cards, four special showcase frame cards, and at least two rare or mythic rare cards. The four showcase frame cards feature stunning alternate art and special frames made just for throne of eldraine (eld). One card will be something you can't get in traditional booster packs, like Arcane Signet or kenrith, returned King (representative, not necessarily the cards you will receive.)",
      picture: Image.asset("assets/images/dummyThroneBooster1.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "1d9821ee-c8aa-46f9-a4d4-9048add40e88",
      name: "Throne of Eldraine Theme Booster - Black",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      subProductTypeId: "02d09938-750b-4e45-b311-76b25efd2420",
      quantity: 1,
      price: 12.70,
      description: "Theme Boosters help new and casual expand their collection with colors that they're already invested in. Enhance your MTG deck with 35 cards from Throne of Eldraine, including at least one rare or mythic rare card. Add 25 lands to start building a 60-card your colored deck.",
      picture: Image.asset("assets/images/dummyThroneBooster2.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "d3fad5a8-f3e0-4477-9657-e66b0f14fff1",
      name: "Throne of Eldraine Theme Booster - Red",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      subProductTypeId: "02d09938-750b-4e45-b311-76b25efd2420",
      quantity: 9,
      price: 9.59,
      description: "Theme Boosters help new and casual expand their collection with colors that they're already invested in. Enhance your MTG deck with 35 cards from Throne of Eldraine, including at least one rare or mythic rare card. Add 25 lands to start building a 60-card your colored deck.",
      picture: Image.asset("assets/images/dummyThroneBooster3.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "25493325-f396-447a-a373-3fdb3276b1ea",
      name: "Throne of Eldraine Rowan, Fearless Sparkmage Planeswalker Deck",
      subProductId: "bbe584aa-41a0-4f95-8336-b0197dbee63b",
      subProductTypeId: "73a50808-74ae-4b87-8309-6fb7cc447b01",
      quantity: 5,
      price: 14.41,
      description: "This Magic: The Gathering Starter deck is ready to go. Battle a few times to understand how to play your deck, then open the 2 included booster packs to customize it. Rowan inspires great loyalty in those who follow her. Attack relentlessly, using abilities to power up your cards, then use Rowan herself to push through the final points of damage and finish off your opponent.",
      picture: Image.asset("assets/images/dummyThroneDeck.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "32c01525-1e07-4fad-9407-bbf8cea8928d",
      name: "Core Set 2020 (M20) Bundle",
      subProductId: "9b90445c-70fa-4f12-bd49-a88bf7e51943",
      subProductTypeId: "d5004a42-8371-4b2b-97ad-627d17e40532",
      quantity: 14,
      price: 32.14,
      description: "Includes 10 Core Set 2020 (M20) booster packs, each with 15 Magic cards. Pick your favorites, put them in your deck, and battle. 20 basic lands, 20 foil basic lands, 1 oversized Spindown life counter not found elsewhere, and a foil alternate-art rare from M20. Core Set 2020 (M20) is the perfect way to get back into the game. Jump back in and experience all the combat, strategy, and art that made the game iconic. Righteous angels and ferocious dragons await. Every booster pack includes at least 1 rare or mythic rare card. The original strategy card game, Magic: The Gathering (MTG) has inspired more than 20 million fans over 25 years.",
      picture: Image.asset("assets/images/dummy2020Bundle.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "e1b52624-cc23-4371-bcef-0d6c7d7b7399",
      name: "Core Set 2020 (M20) Booster Box",
      subProductId: "9b90445c-70fa-4f12-bd49-a88bf7e51943",
      subProductTypeId: "5210d982-fa30-4e28-80bc-72bd406ac9e3",
      quantity: 8,
      price: 103.39,
      description: "Includes 36 Core Set 2020 (M20) booster packs, each with 15 Magic cards. Pick your favorites, put them in your deck, and battle. Crack your box and booster draft with up to 12 friends for an unforgettable game night filled with epic creatures and devastating spells. Core Set 2020 (M20) is the perfect way to get back into the game. Jump back in and experience all the combat, strategy, and art that made the game iconic. Righteous angels and ferocious dragons await. Every booster pack includes at least 1 rare or mythic rare card.",
      picture: Image.asset("assets/images/dummy2020BoosterBox.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "3f8e4cff-4cc6-46c4-a959-5ba5c2d006eb",
      name: "War of The Spark Bundle",
      subProductId: "06940d15-1fe1-4a03-a9af-7998a54354d5",
      subProductTypeId: "7176efaf-1aef-42f2-bc5c-f45690043577",
      quantity: 4,
      price: 35.03,
      description: "Your War of the Spark Bundle includes 10 booster packs with at least one PLANESWALKER IN EVERY PACK, 80 plus basic land cards, 1 Spindown life counter, and a player’s guide. RAVNICA is under siege as Nicol Bolas and the planeswalkers of the Gatewatch face off in their epic final battle. New mechanic AMASS and returning favorite PROLIFERATE both help strengthen your creatures with +1/+1 counters. War of the Spark is the follow-up to the hit Magic: The Gathering (MTG) expansions GUILDS OF RAVNICA and RAVNICA ALLEGIANCE. The first modern collectible card game, MAGIC: THE GATHERING (MTG) has inspired more than 20 million fans over 25 years. WIZARDS OF THE COAST has been making the world’s best strategy games for almost 30 years - Magic: The Gathering (MTG), Dungeons & Dragons (D&D), and many more.",
      picture: Image.asset("assets/images/dummySparkBundle.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "c5a56ed4-09c1-419f-a7aa-515ec798bb96",
      name: "War of The Spark Booster Pack",
      subProductId: "06940d15-1fe1-4a03-a9af-7998a54354d5",
      subProductTypeId: "b3568489-8e54-47c9-8cfb-79c78f306c34",
      quantity: 12,
      price: 3.91,
      description: "Some booster packs may even contain a premium foil card. Entire set features 36 Planeswalker cards to collect. Each booster pack contains 15 cards.",
      picture: Image.asset("assets/images/dummySparkBooster.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "524fb35f-76ad-4a66-9309-eb5cfb1bf7eb",
      name: "War of The Spark Booster Box",
      subProductId: "06940d15-1fe1-4a03-a9af-7998a54354d5",
      subProductTypeId: "41351288-5085-47a7-87f2-b76947638f0d",
      quantity: 4,
      price: 33.47,
      description: "Your War of the Spark booster box contains at least one PLANESWALKER IN EVERY PACK. (Rarity varies between uncommon and mythic rare.) RAVNICA is under seige as Nicol Bolas and the planeswalkers of the Gatewatch face off in their epic final battle. New mechanic AMASS and returning favorite PROLIFERATE both help strenghten your creatures with +1/+1 counters. War of the Spark is the follow-up to the hit Magic: The Gathering (MTG) expansions GUILDS OF RAVNICA and RAVNICA ALLEGIANCE. Your War of the Spark booster box includes 540 cards, including at least 36 planeswalker cards, to help fill your binder.",
      picture: Image.asset("assets/images/dummySparkBoosterBox.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "c1ae9631-0353-4e8f-8c0f-3996ed5fe642",
      name: "Ravnica Allegiance Bundle",
      subProductId: "cc486800-52fc-4910-883d-c3c38b2d290b",
      subProductTypeId: "2880521b-8b7e-420a-b660-b336b010181b",
      quantity: 1,
      price: 34.45,
      description: "Ravnica is one of Magic’s most beloved settings, where guilds jockey for power and control and multicolored cards show up in force. New takes on Ravnica classics like Guildmages and split cards await. Every Magic player needs land cards, and dice can make keeping score more fun. Each Bundle comes with a 20-sided spin-down life counter, 75 basic land cards and 5 foil basic land cards, a storage box, and a Player’s guide, which contains a visual encyclopedia of Ravnica Allegiance. Your Bundle contains 10 booster packs, 75 basic land cards, and 5 foil basic land cards from Ravnica Allegiance, the follow-up to the hit expansions Guilds of Ravnica. Each booster pack contains 15 Magic cards (230 Magic cards total, including lands). Pick your favorites, put them in your deck, and battle! Magic: The Gathering is the first modern collectible card game. Magic has inspired more than 20 million fans over 25 years, from the first dragons and angels to today’s planeswalkers and Commander decks. Wizards of the Coast has been making the world’s best strategy games for almost 30 years: Magic: The Gathering (MTG), Dungeons & Dragons (D&D), many board games under the Avalon Hill umbrella, and more. Explore them all, discover new favorites, and make new friends along the way.",
      picture: Image.asset("assets/images/dummyRavnicaBundle.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "1fddafdb-2103-4687-bc6a-8bd5727e3ed3",
      name: "Ravnica Allegiance Booster Box",
      subProductId: "cc486800-52fc-4910-883d-c3c38b2d290b",
      subProductTypeId: "f07e0cb4-7f44-4f09-b02a-bf0586a24741",
      quantity: 10,
      price: 101.99,
      description: "Ravnica is one of Magic’s most beloved settings, where guilds jockey for power and control and multicolored cards show up in force. New takes on Ravnica classics like Guildmages and split cards await. A booster box contains 36 booster packs of Guilds of Ravnica, the follow-up to the hit expansions Core Set 2019 and Dominaria. Each booster pack contains 15 Magic cards (540 cards total). Pick your favorites, put them in your deck, and battle! avnica Allegiance includes powerful planeswalkers like Domri, Chaos Bringer and Dovin, Grand Arbiter, as well as game-changing creature spells like Angel of Grace and Shock Lands like Breeding Pool and Godless Shrine (Note: cards listed are representative and not necessarily the cards you will receive.) Your Guilds of Ravnica booster box holds enough packs to host your own booster draft with as many as twelve friends. (Note: a booster draft requires more basic land cards than a booster box includes.)",
      picture: Image.asset("assets/images/dummyRavnicaBoosterBox.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "5093e8f0-0b0d-4cea-a45a-5d1ea2477745",
      name: "Guilds of Ravnica Bundle",
      subProductId: "4b5de14f-6255-46cf-adc7-52b21ba1dc97",
      subProductTypeId: "873fca8e-0f74-4aea-942f-c08c6f43b044",
      quantity: 6,
      price: 59.95,
      description: "Ravnica is one of Magic’s most beloved settings, where guilds jockey for power and control and multicolored cards show up in force. New takes on Ravnica classics like Guildmages and split cards await. Every Magic player needs land cards, and dice can make keeping score more fun. Each Bundle comes with a 20-sided spin-down life counter, 75 basic land cards and 5 foil basic lands, a storage box, and a Player’s guide, which contains a visual encyclopedia of Guilds of Ravnica. Your Bundle contains 10 booster packs, 75 basic land cards, and 5 foil basic land cards from Guilds of Ravnica, the follow-up to the hit expansions Core Set 2019 and Dominaria. Each booster pack contains 15 Magic cards (230 Magic cards total, including lands). Pick your favorites, put them in your deck, and battle! Guilds of Ravnica includes planeswalkers like Vraska, Golgari Queen, game-changing spells like Assassin’s Trophy, and the return of “shock lands” like Sacred Foundry and Steam Vents.",
      picture: Image.asset("assets/images/dummyGuildBundle.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "9b10bead-4cda-408d-9443-a6935121e79f",
      name: "Guilds of Ravnica Booster Box",
      subProductId: "4b5de14f-6255-46cf-adc7-52b21ba1dc97",
      subProductTypeId: "8301137b-0fdf-4918-81f6-37694d0abc70",
      quantity: 3,
      price: 99.93,
      description: "Ravnica is one of Magic’s most beloved settings, where guilds jockey for power and control and multicolored cards show up in force. New takes on Ravnica classics like Guildmages and split cards await. A booster box contains 36 booster packs of Guilds of Ravnica, the follow-up to the hit expansions Core Set 2019 and Dominaria. Each booster pack contains 15 Magic cards (540 cards total). Pick your favorites, put them in your deck, and battle! Your Guilds of Ravnica booster box holds enough packs to host your own booster draft with as many as twelve friends. (Note: a booster draft requires more basic land cards than a booster box includes.)",
      picture: Image.asset("assets/images/dummyGuildBoosterBox.png", fit: BoxFit.fill, width: 200, height: 250)
    ),
    SubProductDetail(
      id: "a8fef138-afa7-4b48-8089-7bae9dd03472",
      name: "Guilds of Ravnica - Guild Kit - Izzet (Basic)",
      subProductId: "4b5de14f-6255-46cf-adc7-52b21ba1dc97",
      subProductTypeId: "c82487f9-bd90-46ee-8eca-cd99eb77098c",
      quantity: 27,
      price: 49.99,
      description: "Guild Kit - Izzet. The Izzet League are charged with attending to Ravnican civic works, including water supply systems, sewers, heating systems, boilers, and roadways. In addition to carrying out these functions, the Izzet members, obsessive, keen, and creative intellectuals, who often have short attention spans, are known to perform magical experiments, ever with reckless abandon and sometimes with spectacular but severe results.",
      picture: Image.asset("assets/images/dummyGuildGuildKit.png", fit: BoxFit.fill, width: 200, height: 250)
    )
  ];

  List<SubProductDetail> get allSubProductDetails {
    return [..._dummyList];
  }

  SubProductDetail getSingleSubProductDetailById(String id) {
    return _dummyList.firstWhere((subProductDetail) => subProductDetail.id == id, orElse: () => null);
  }

  List<SubProductDetail> getSubProductTypeSubProductDetails(String subProductId, subProductTypeId) {
    try
    {
      return _dummyList.where((subProductDetail) => subProductDetail.subProductId == subProductId && subProductDetail.subProductTypeId == subProductTypeId).toList();
    }
    catch(_)
    {
      throw AppException(ErrorMessages.userNotCreated);
    }
  }
}