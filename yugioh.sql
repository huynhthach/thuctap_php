-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 06, 2024 lúc 04:20 PM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `yugioh`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `itemcategories`
--

CREATE TABLE `itemcategories` (
  `CategoryID` varchar(10) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `itemcategories`
--

INSERT INTO `itemcategories` (`CategoryID`, `CategoryName`) VALUES
('FM', 'Fusion Monster'),
('MC', 'Monster card'),
('SC', 'Spell card'),
('TC', 'Trap card');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `items`
--

CREATE TABLE `items` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(255) DEFAULT NULL,
  `ItemCategory` varchar(10) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `items`
--

INSERT INTO `items` (`ItemID`, `ItemName`, `ItemCategory`, `Description`, `image`) VALUES
(1, 'Dark Magician Girl', 'MC', 'Gains 300 ATK for every \"Dark Magician\" or \"Magician of Black Chaos\" in the GY.', '38033121.jpg'),
(2, 'Monster Reborn', 'SC', 'Target 1 monster in either GY; Special Summon it.', '83764719.jpg'),
(3, 'Mirror Force', 'TC', 'When an opponent\'s monster declares an attack: Destroy all your opponent\'s Attack Position monsters.', '44095762.jpg'),
(4, 'Dark Magician', 'MC', 'The ultimate wizard in terms of attack and defense.\'\'', '46986414.jpg'),
(5, 'Obelisk the Tormentor', 'MC', 'Requires 3 Tributes to Normal Summon (cannot be Normal Set). This card\'s Normal Summon cannot be negated. When Normal Summoned, cards and effects cannot be activated. Neither player can target this card with card effects. Once per turn, during the End Phase, if this card was Special Summoned: Send it to the GY. You can Tribute 2 monsters; destroy all monsters your opponent controls. This card cannot declare an attack the turn this effect is activated.', '10000000.jpg'),
(6, 'The Winged Dragon of Ra', 'MC', 'Cannot be Special Summoned. Requires 3 Tributes to Normal Summon (cannot be Normal Set). This card\'s Normal Summon cannot be negated. When Normal Summoned, other cards and effects cannot be activated. When this card is Normal Summoned: You can pay LP so that you only have 100 left; this card gains ATK/DEF equal to the amount of LP paid. You can pay 1000 LP, then target 1 monster on the field; destroy that target.', '10000010.jpg'),
(7, 'Slifer the Sky Dragon', 'MC', 'Requires 3 Tributes to Normal Summon (cannot be Normal Set). This card\'s Normal Summon cannot be negated. When Normal Summoned, cards and effects cannot be activated. Once per turn, during the End Phase, if this card was Special Summoned: Send it to the GY. Gains 1000 ATK/DEF for each card in your hand. If a monster(s) is Normal or Special Summoned to your opponent\'s field in Attack Position: That monster(s) loses 2000 ATK, then if its ATK has been reduced to 0 as a result, destroy it.', '10000020.jpg'),
(8, 'Blue-Eyes White Dragon', 'MC', 'This legendary dragon is a powerful engine of destruction. Virtually invincible, very few have faced this awesome creature and lived to tell the tale.', '89631139.jpg'),
(9, 'Pot of Greed', 'SC', 'Draw 2 cards.', '55144522.jpg'),
(10, 'Card of Sanctity', 'SC', 'Banish all other cards you control and in your hand (min. 1 from each); draw until you have 2 cards in your hand.', '42664989.jpg'),
(11, 'Red-Eyes Black Dragon', 'MC', '\'\'A ferocious dragon with a deadly attack.\'\'', '74677422.jpg'),
(12, 'Solemn Judgment', 'TC', 'When a monster(s) would be Summoned, OR a Spell/Trap Card is activated: Pay half your LP; negate the Summon or activation, and if you do, destroy that card.', '41420027.jpg'),
(13, 'Magic Cylinder', 'TC', 'When an opponent\'s monster declares an attack: Target the attacking monster; negate the attack, and if you do, inflict damage to your opponent equal to its ATK.', '62279055.jpg'),
(14, 'Polymerization', 'SC', 'Fusion Summon 1 Fusion Monster from your Extra Deck, using monsters from your hand or field as Fusion Material.', '24094653.jpg'),
(15, 'Dark Paladin', 'FM', '\"Dark Magician\" + \"Buster Blader\"\r\nMust be Fusion Summoned. When a Spell Card is activated (Quick Effect): You can discard 1 card; negate the activation, and if you do, destroy it. This card must be face-up on the field to activate and to resolve this effect. Gains 500 ATK for each Dragon monster on the field and in the GY.', '98502113.jpg'),
(16, 'Blue-Eyes Ultimate Dragon', 'FM', '\"Blue-Eyes White Dragon\" + \"Blue-Eyes White Dragon\" + \"Blue-Eyes White Dragon\"', '23995346.jpg'),
(17, 'Called by the Grave', 'SC', 'Target 1 monster in your opponent\'s GY; banish it, and if you do, until the end of the next turn, its effects are negated, as well as the activated effects and effects on the field of monsters with the same original name.', '24224830.jpg'),
(18, 'The Deep Grave', 'TC', 'Target 1 monster in either player\'s GY; during your next Standby Phase, Special Summon it from the GY.', '17688543.jpg'),
(19, 'Silent Magician', 'MC', 'Cannot be Normal Summoned/Set. Must be Special Summoned (from your hand) by Tributing 1 Spellcaster-Type monster, and cannot be Special Summoned by other ways. This card gains 500 ATK for each card in your hand. Once per turn, during either player\'s turn, when a Spell Card is activated: You can negate the activation. If this card is destroyed by battle, or if this card in its owner\'s control is destroyed by an opponent\'s card effect: You can Special Summon 1 \"Silent Magician\" monster from your hand or Deck, except \"Silent Magician\", ignoring its Summoning conditions.', '41175645.jpg'),
(20, 'Silent Swordsman', 'MC', 'Cannot be Normal Summoned/Set. Must be Special Summoned (from your hand) by Tributing 1 Warrior-Type monster, and cannot be Special Summoned by other ways. Once per turn, during the Standby Phase: This card gains 500 ATK. Once per turn, during either player\'s turn, when a Spell Card is activated: You can negate the activation. If this card is destroyed by battle, or if this card in its owner\'s control is destroyed by an opponent\'s card effect: You can Special Summon 1 \"Silent Swordsman\" monster from your hand or Deck, except \"Silent Swordsman\", ignoring its Summoning conditions.', '15180041.jpg'),
(22, 'Elemental HERO Neos', 'MC', '\'\'A new Elemental HERO has arrived from Neo-Space! When he initiates a Contact Fusion with a Neo-Spacian his unknown powers are unleashed.\'\'', '89943723.jpg'),
(23, 'Kuriboh', 'MC', 'During damage calculation, if your opponent\'s monster attacks (Quick Effect): You can discard this card; you take no battle damage from that battle.', '40640057.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `NewsID` int(11) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `PublishedDate` datetime DEFAULT NULL,
  `CategoryID` varchar(10) DEFAULT NULL,
  `image` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`NewsID`, `Title`, `PublishedDate`, `CategoryID`, `image`) VALUES
(1, 'Gandora X OCG Errata', '2023-12-18 03:16:24', '1', 'Gandora.jpg'),
(2, 'The Unstoppable “Master of Dragon Magia” Appears!', '2023-12-18 03:17:30', '1', 'b0mjxkzmLC.jpg'),
(3, 'Global Release 7th Anniversary Campaign [DUEL LINKS]', '2023-12-18 03:19:21', '1', 'SwordsofRevealingLight-OW.jpg'),
(5, 'New Structure Deck: Cyber Dragon Revolution', '2023-12-18 03:07:26', '1', '23995346.jpg'),
(14, 'Yugioh 2023', '2023-12-14 14:37:02', '1', 'frieren.jpg'),
(17, 'Drag Your Opponents To Hell With “Zoma the Earthbound Spirit”!', '2024-01-04 15:37:46', '2', 'DraggedToHell.jpg'),
(18, 'Ascend with “Metaltronios”', '2024-01-04 15:38:35', '2', 'SummonForthAMiracle.jpg'),
(19, 'January 2024 Limit Regulation', '2024-01-04 15:40:20', '2', '800px-HotRedDragonArchfiendKingCalamity-EN-Manga-5D-NC.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `newscategories`
--

CREATE TABLE `newscategories` (
  `CategoryID` varchar(10) NOT NULL,
  `CategoryName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `newscategories`
--

INSERT INTO `newscategories` (`CategoryID`, `CategoryName`) VALUES
('1', 'Tin tức'),
('2', 'Hướng dẫn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `newsdetails`
--

CREATE TABLE `newsdetails` (
  `NewsID` int(11) DEFAULT NULL,
  `ImagePath` varchar(255) DEFAULT NULL,
  `Content` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `newsdetails`
--

INSERT INTO `newsdetails` (`NewsID`, `ImagePath`, `Content`) VALUES
(1, 'twitter-209x300.jpg', 'After it’s text update in Master Duel, Gandora X has in the OCG to match it’s TCG and Master Duel counterparts. The OCG times Jump Festa event has confirmed Gandora X will also be unlimited during the next OCG Forbidden & Limited update.'),
(1, 'twitter-209x300.jpg', 'After it’s text update in Master Duel, Gandora X has in the OCG to match it’s TCG and Master Duel counterparts. The OCG times Jump Festa event has confirmed Gandora X will also be unlimited during the next OCG Forbidden & Limited update.'),
(1, 'twitter-209x300.jpg', 'After it’s text update in Master Duel, Gandora X has in the OCG to match it’s TCG and Master Duel counterparts. The OCG times Jump Festa event has confirmed Gandora X will also be unlimited during the next OCG Forbidden & Limited update.'),
(1, 'twitter-209x300.jpg', 'After it’s text update in Master Duel, Gandora X has in the OCG to match it’s TCG and Master Duel counterparts. The OCG times Jump Festa event has confirmed Gandora X will also be unlimited during the next OCG Forbidden & Limited update.'),
(2, 'blue-eyes-cum-204x300.jpg', 'QCDB-JP001 Master of Dragon Magia / Dragon Magia Master\r\nLIGHT Dragon / Fusion / Effect\r\nLV12 5000/4000\r\n“Blue-Eyes Ultimate Dragon” (or 3 “Blue-Eyes” monsters) + 1 “Chaos” or “Black Luster Soldier” Ritual Monster\r\nMust be Fusion Summoned.\r\n(1) When your opponent activates a card or effect (Quick Effect): You can negate the activation, and if you do, destroy that card. You can only activate this effect of this card’s name in response to each card type (Monster/Spell/Trap) once per turn.\r\n(2) If this face-up card leaves the field by your opponent: You can Special Summon 1 “Blue-Eyes” monster, or 1 “Chaos” Ritual Monster, or 1 “Black Luster Soldier” Ritual Monster from your GY or Extra Deck.'),
(2, 'blue-eyes-cum-204x300.jpg', 'QCDB-JP001 Master of Dragon Magia / Dragon Magia Master\r\nLIGHT Dragon / Fusion / Effect\r\nLV12 5000/4000\r\n“Blue-Eyes Ultimate Dragon” (or 3 “Blue-Eyes” monsters) + 1 “Chaos” or “Black Luster Soldier” Ritual Monster\r\nMust be Fusion Summoned.\r\n(1) When your opponent activates a card or effect (Quick Effect): You can negate the activation, and if you do, destroy that card. You can only activate this effect of this card’s name in response to each card type (Monster/Spell/Trap) once per turn.\r\n(2) If this face-up card leaves the field by your opponent: You can Special Summon 1 “Blue-Eyes” monster, or 1 “Chaos” Ritual Monster, or 1 “Black Luster Soldier” Ritual Monster from your GY or Extra Deck.'),
(2, 'blue-eyes-cum-204x300.jpg', 'QCDB-JP001 Master of Dragon Magia / Dragon Magia Master\r\nLIGHT Dragon / Fusion / Effect\r\nLV12 5000/4000\r\n“Blue-Eyes Ultimate Dragon” (or 3 “Blue-Eyes” monsters) + 1 “Chaos” or “Black Luster Soldier” Ritual Monster\r\nMust be Fusion Summoned.\r\n(1) When your opponent activates a card or effect (Quick Effect): You can negate the activation, and if you do, destroy that card. You can only activate this effect of this card’s name in response to each card type (Monster/Spell/Trap) once per turn.\r\n(2) If this face-up card leaves the field by your opponent: You can Special Summon 1 “Blue-Eyes” monster, or 1 “Chaos” Ritual Monster, or 1 “Black Luster Soldier” Ritual Monster from your GY or Extra Deck.'),
(2, 'blue-eyes-cum-204x300.jpg', 'QCDB-JP001 Master of Dragon Magia / Dragon Magia Master\r\nLIGHT Dragon / Fusion / Effect\r\nLV12 5000/4000\r\n“Blue-Eyes Ultimate Dragon” (or 3 “Blue-Eyes” monsters) + 1 “Chaos” or “Black Luster Soldier” Ritual Monster\r\nMust be Fusion Summoned.\r\n(1) When your opponent activates a card or effect (Quick Effect): You can negate the activation, and if you do, destroy that card. You can only activate this effect of this card’s name in response to each card type (Monster/Spell/Trap) once per turn.\r\n(2) If this face-up card leaves the field by your opponent: You can Special Summon 1 “Blue-Eyes” monster, or 1 “Chaos” Ritual Monster, or 1 “Black Luster Soldier” Ritual Monster from your GY or Extra Deck.'),
(3, '9ad4bdae-450x470.jpg', '1 Shield & Sword (RUSH/Premium Foil)\r\n1 Swords of Revealing Light (SPEED/Extreme Premium Foil)\r\n3 Blue-Eyes White Dragon (SPEED/Premium Foil)\r\n\r\nLog-In Bonuses:\r\n1 Dream UR Ticket / Dream SR Ticket\r\n1 UR Ticket / SR Ticket (Premium)\r\n1 UR Ticket / SR Ticket\r\n2 Legend Duelist Rainbow Pack (SEVENS World Only)\r\n\r\n1 Free Structure Deck “Strongest Ace Breaker”\r\n\r\nOther:\r\n\r\n1000 Gems\r\n1 Anniversary Accessory (Playmat)\r\n1 Anniversary Accessory (Sleeves)\r\n1 Skill Ticket\r\n1 Character Get Ticket\r\nLegend Skill (Swords of Revealing Light Related) for Yami Yugi, Yugi Muto, and Yugi Muto (DSOD)'),
(3, '9ad4bdae-450x470.jpg', '1 Shield & Sword (RUSH/Premium Foil)\r\n1 Swords of Revealing Light (SPEED/Extreme Premium Foil)\r\n3 Blue-Eyes White Dragon (SPEED/Premium Foil)\r\n\r\nLog-In Bonuses:\r\n1 Dream UR Ticket / Dream SR Ticket\r\n1 UR Ticket / SR Ticket (Premium)\r\n1 UR Ticket / SR Ticket\r\n2 Legend Duelist Rainbow Pack (SEVENS World Only)\r\n\r\n1 Free Structure Deck “Strongest Ace Breaker”\r\n\r\nOther:\r\n\r\n1000 Gems\r\n1 Anniversary Accessory (Playmat)\r\n1 Anniversary Accessory (Sleeves)\r\n1 Skill Ticket\r\n1 Character Get Ticket\r\nLegend Skill (Swords of Revealing Light Related) for Yami Yugi, Yugi Muto, and Yugi Muto (DSOD)'),
(3, '9ad4bdae-450x470.jpg', '1 Shield & Sword (RUSH/Premium Foil)\r\n1 Swords of Revealing Light (SPEED/Extreme Premium Foil)\r\n3 Blue-Eyes White Dragon (SPEED/Premium Foil)\r\n\r\nLog-In Bonuses:\r\n1 Dream UR Ticket / Dream SR Ticket\r\n1 UR Ticket / SR Ticket (Premium)\r\n1 UR Ticket / SR Ticket\r\n2 Legend Duelist Rainbow Pack (SEVENS World Only)\r\n\r\n1 Free Structure Deck “Strongest Ace Breaker”\r\n\r\nOther:\r\n\r\n1000 Gems\r\n1 Anniversary Accessory (Playmat)\r\n1 Anniversary Accessory (Sleeves)\r\n1 Skill Ticket\r\n1 Character Get Ticket\r\nLegend Skill (Swords of Revealing Light Related) for Yami Yugi, Yugi Muto, and Yugi Muto (DSOD)'),
(3, '9ad4bdae-450x470.jpg', '1 Shield & Sword (RUSH/Premium Foil)\r\n1 Swords of Revealing Light (SPEED/Extreme Premium Foil)\r\n3 Blue-Eyes White Dragon (SPEED/Premium Foil)\r\n\r\nLog-In Bonuses:\r\n1 Dream UR Ticket / Dream SR Ticket\r\n1 UR Ticket / SR Ticket (Premium)\r\n1 UR Ticket / SR Ticket\r\n2 Legend Duelist Rainbow Pack (SEVENS World Only)\r\n\r\n1 Free Structure Deck “Strongest Ace Breaker”\r\n\r\nOther:\r\n\r\n1000 Gems\r\n1 Anniversary Accessory (Playmat)\r\n1 Anniversary Accessory (Sleeves)\r\n1 Skill Ticket\r\n1 Character Get Ticket\r\nLegend Skill (Swords of Revealing Light Related) for Yami Yugi, Yugi Muto, and Yugi Muto (DSOD)'),
(5, 'frieren.jpg', 'Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.'),
(5, 'frieren.jpg', 'Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.'),
(5, 'frieren.jpg', 'Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.'),
(5, 'frieren.jpg', 'Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.Nội dung: Hãy cùng xem xét các thay đổi mới nhất trong danh sách cấm và giới hạn của Yu-Gi-Oh! Trading Card Game và tác động của chúng đối với môi trường chơi.'),
(14, 'TidalDragonRulerofWaterfall.jpg', 'We’re outright going experimental here.\r\n\r\nA new F/L List has been announced for Master Duel. The list will be applying from December 5th (time zones applying). These are all cards that are currently Forbidden, so these cards will also be obtainable in certain packs, and also can now be generated:\r\n\r\nNewly Limited:\r\nPerformapal Monkeyboard\r\nRedox, Dragon Ruler of Boulders\r\nTidal, Dragon ruler of Waterfalls\r\nZoodiac Ratpier\r\n\r\nNo Longer Limited:\r\nZoodiac Barrage\r\n\r\nKeep in mind these new changes happen at the same time as the previously announced changes.\r\n\r\n-New Selection Packs announced:\r\n–Beginning of the Next Journey\r\n“In addition to the combat prowess of “Albion the Sanctifire Dragon,” “Mannadium,” which specializes in Synchro Summobning, and “Gate Guardians Combined,” which has gained tremendous power, are here! The end of a journey is also a new beginning.”\r\nConfirmed cards:\r\nAlbion the Sanctifire Dragon (UR)\r\nGate Guardians Combined (UR)\r\nVicious Astraloud (UR)\r\n\r\nRingowurm, the Dragon Guarding the Hundred Apples (UR)\r\nMannadium Prime-Heart (UR)\r\n\r\n–Mighty Contenders\r\n“Come forth… Those who aim for the pinnacle! In addition to factions like “Mathmech” and “Zoodiac,” many powerful cards, such as “Redox, Dragon Ruler of Boulders,” are included in this pack!”\r\nConfirmed cards:\r\nGhost Reaper & Winter Cherries (UR)\r\nRedox, Dragon Ruler of Boulders (UR)\r\n\r\nGeomathmech Final Sigma (UR)\r\n\r\nZoodiac Ratpier\r\n\r\nTri-Brigade Arms Bucephalus II (UR)'),
(17, 'DraggedToHell.jpg', 'LEDE-JP079 地縛死霊ゾーマ Jibaku Shiryou Zoma (Zoma the Earthbound Spirit)\r\nContinuous Trap Card\r\nYou can only use either the (1)st and (2)nd effect of this card’s name each once per turn.\r\n(1) Special Summon this card as an Effect Monster (Zombie/DARK/Level 4/ATK 1800/DEF 500) with the following effect (this card is also still a Trap.)\r\n• Monsters your opponent controls that can attack must attack this card.\r\n(2) If this card Special Summoned by this card’s effect is destroyed by an opponent’s attacking monster: Inflict damage to your opponent equal to double the original ATK of the monster that destroyed it. (max. 3000).'),
(18, 'SummonForthAMiracle.jpg', 'Quick-Play Spell Card\r\nYou can only activate 1 card with this card’s name per turn.\r\n(1) Target 1 face-up non-Token Monster your opponent controls; Special Summon 1 monster that has 2 or more of the same Type, Attribute, and/or ATK from your hand, Deck, or Extra Deck (but its effects are negated), and if you do, negate the targeted monster’s effects, then, if those 2 monsters have the same name, you can banish both face-down. Your opponent cannot activate the targeted monster’s effects in response to this card’s activation.\r\n\r\nNote: This card’s Kanji is a play on 運命共同体 (To share the same destiny, to be in the same boat). But this card’s Kanji reads like “Same World Spirit Abyss Body”.'),
(19, '800px-HotRedDragonArchfiendKingCalamity-EN-Manga-5D-NC.png', 'Maybe Aiming for the Top was a mistake.\r\n\r\n\r\nForbidden:\r\n\r\nHot Red Dragon Archfiend King Calamity (From Unlimited to Forbidden)\r\n\r\nLimited:\r\n\r\nRedox, Dragon Ruler of Boulders (Forbidden to Limited)\r\nIb the World Chalice Justiciar (Forbidden to Limited)\r\nHeavy Storm (Forbidden to Limited)\r\nEMERGENCY! (Unlimited to Limited)\r\nRivalry of Warlords (Semi-Limited to Limited)\r\n\r\nSemi-Limited:\r\n\r\nChange of Heart (Limited to Semi-Unlimited)\r\nMy Friend Purrely (Unlimited to Semi-Limited)\r\nThere Can Be Only One (Unlimited to Semi-Limited)\r\nBig Welcome Labrynth (Unlimited to Semi-Limited)\r\n\r\nUnlimited:\r\n\r\nGandora-X the Dragon of Demolition (Forbidden to Unlimited; Erratum)\r\nTri-Brigade Fraktall (Semi-Limited to Unlimited)\r\nSky Striker Mobilize – Engage! (Semi-Limited to Unlimited)\r\nDragonic Diagram (Semi-Limited to Unlimited)\r\nFloowandereeze and the Magnificent Map (Semi-Limited to Unlimited)');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `owneditems`
--

CREATE TABLE `owneditems` (
  `ItemID` int(11) DEFAULT NULL,
  `OwnerID` int(11) DEFAULT NULL,
  `NgaySoHuu` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `owneditems`
--

INSERT INTO `owneditems` (`ItemID`, `OwnerID`, `NgaySoHuu`) VALUES
(1, 11, '2023-12-16 12:47:49'),
(2, 11, '2023-12-16 13:41:02'),
(4, 11, '2023-12-18 01:42:22'),
(5, 11, '2023-12-22 01:18:41'),
(19, 11, '2023-12-22 01:29:15'),
(20, 11, '2023-12-22 01:29:17'),
(22, 11, '2023-12-22 02:26:43'),
(22, 19, '2023-12-25 02:29:02'),
(20, 19, '2023-12-25 02:29:17'),
(19, 19, '2023-12-25 02:29:19'),
(18, 19, '2023-12-25 02:29:21'),
(4, 19, '2023-12-25 02:29:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`RoleID`, `RoleName`) VALUES
(1, 'Khách hàng'),
(2, 'Quản trị');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(50) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `NgayTao` datetime DEFAULT NULL,
  `IDRole` int(11) DEFAULT NULL,
  `imageus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Email`, `NgayTao`, `IDRole`, `imageus`) VALUES
(11, 'huynhLong', '$2y$10$ESB8t/riFBkUe8mhiQXNdewUdGFTYUxYrv2aIWEoTnLqcPaQ5u.G.', 'long@gmail.com', '2023-12-05 03:32:27', 1, NULL),
(12, 'adminUser', '$2y$10$E.wJt4g1vxXktxz6DBF2AuLg52YZe1XTQU1KEr.D2ulIckQ6XQ59.', 'haha@gmail.com', '2023-12-05 03:33:23', 2, NULL),
(15, 'nguyenThanh', '$2y$10$6Xel5.F1.h27.spTXvf2eOJuFtqtH5rK0Bd5J85zs/NnE3ozdi8je', 'long12@gmail.com', '2023-12-15 01:54:48', 1, NULL),
(19, 'long123', '$2y$10$8TevLw9KCWW6P5xRBFvy4u4OyJpym2EiV34ihwm09DCE/TuMiOdy.', '123@gmail.com', '2023-12-25 02:28:21', 1, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `views`
--

CREATE TABLE `views` (
  `Path` varchar(100) NOT NULL,
  `ID` int(11) NOT NULL,
  `View` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `views`
--

INSERT INTO `views` (`Path`, `ID`, `View`) VALUES
('/news/1', 1, 5),
('/news/2', 2, 1),
('/news/3', 3, 2),
('/cardinfo/increment-views/4', 4, 2),
('/news/5', 5, 4),
('/cardinfo/increment-views/12', 12, 1),
('/news/14', 14, 1),
('/cardinfo/increment-views/15', 15, 0),
('/cardinfo/increment-views/16', 16, 0),
('/cardinfo/increment-views/19', 19, 5),
('/cardinfo/increment-views/20', 20, 8),
('/cardinfo/increment-views/22', 22, 7),
('/cardinfo/increment-views/3', 3, 0),
('/cardinfo/increment-views/13', 13, 0),
('/cardinfo/increment-views/18', 18, 2),
('/cardinfo/increment-views/5', 5, 0),
('/cardinfo/increment-views/23', 23, 3),
('/news/17', 17, 1),
('/news/18', 18, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `itemcategories`
--
ALTER TABLE `itemcategories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `ItemCategory` (`ItemCategory`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`NewsID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Chỉ mục cho bảng `newscategories`
--
ALTER TABLE `newscategories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Chỉ mục cho bảng `newsdetails`
--
ALTER TABLE `newsdetails`
  ADD KEY `NewsID` (`NewsID`);

--
-- Chỉ mục cho bảng `owneditems`
--
ALTER TABLE `owneditems`
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleID`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `IDRole` (`IDRole`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `items`
--
ALTER TABLE `items`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `NewsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`ItemCategory`) REFERENCES `itemcategories` (`CategoryID`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `newscategories` (`CategoryID`);

--
-- Các ràng buộc cho bảng `newsdetails`
--
ALTER TABLE `newsdetails`
  ADD CONSTRAINT `newsdetails_ibfk_1` FOREIGN KEY (`NewsID`) REFERENCES `news` (`NewsID`);

--
-- Các ràng buộc cho bảng `owneditems`
--
ALTER TABLE `owneditems`
  ADD CONSTRAINT `owneditems_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `users` (`UserID`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`IDRole`) REFERENCES `roles` (`RoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
