-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2019 at 10:07 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inaq`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(3) NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date` datetime NOT NULL,
  `location` varchar(255) CHARACTER SET latin1 NOT NULL,
  `organiser` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `name`, `date`, `location`, `organiser`, `image`, `description`) VALUES
(2, 'BitnByte9.0', '2019-11-06 01:01:00', 'Klebang', 'FST', 'BitnByte.png', 'Program Family Day'),
(3, 'Anugerah Tokoh Siswa', '2019-11-18 13:01:00', 'Kuala Lumpur', 'KPT', 'Anugerah Tokoh Siswa.jpeg', 'Anugerah berprestij peringkat kebangsaan Malaysia yang ku cintai dan sayangi hingga akhir nanti'),
(4, 'OSCAR', '0000-00-00 00:00:00', 'USIM', 'ISA', 'OSCAR.jpeg', 'saafaweafsf');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `fullname`, `username`, `password`) VALUES
(2, 'MUHAMAD MUHAIMIN BIN JAMALLUDIN', 'min', '$2b$05$ioIKJjb4vrJKx9qJtoW3fO1G057Aps9yZ7j8LO7rJ20ohzKJKp50G'),
(9, 'Ahmad kamal bin Mat', 'Admin', '$2a$10$QNQF9/zKW0NfAVPO/u.7JeGZLdPeSOZb6kbuDrVXwuAAU.NsD7FJq');

-- --------------------------------------------------------

--
-- Table structure for table `publication`
--

CREATE TABLE `publication` (
  `id` int(3) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `year` year(4) NOT NULL,
  `author` varchar(50) CHARACTER SET utf8 NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `language` varchar(20) CHARACTER SET utf8 NOT NULL,
  `institution` varchar(255) CHARACTER SET utf8 NOT NULL,
  `Publication` varchar(20) CHARACTER SET utf8 NOT NULL,
  `pages` int(3) NOT NULL,
  `edition` varchar(20) CHARACTER SET utf8 NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `topic` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `publication`
--

INSERT INTO `publication` (`id`, `title`, `type`, `year`, `author`, `image`, `language`, `institution`, `Publication`, `pages`, `edition`, `link`, `topic`) VALUES
(10, 'المسلمون و كتابه التاريخ – دراه فى التأصيل الاسلامى لعلم التاريخ', 'Book', 1995, 'عبد العليم خضر', 'عبد العليم خضر.png', 'Arabic', 'Ma’had Ali', 'World Institute of I', 318, '2', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/Ebs8taxJ9P9Miz7nOEY5D34BtgKGLD49G1FnJb1aBn9Ttg?e=SBmnKq', 'Science'),
(12, 'Curriculum Integration: An Overview', 'Journal', 2017, 'Amanda Wall et al', 'Amanda Wall et al.png', 'English', 'Georgia Sourthern University', 'Georgia Sourthern Un', 5, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2FIntegrated%20curriculum%2Epdf&parent=%2Fpersonal%2Fmuazz%5Fusi', 'Education'),
(13, 'The integrated curriculum in medical education', 'Journal', 2015, 'David G et al', 'David G et al.png', 'English', 'University of Iowa, Washington Unversity School of Medicine', 'University of Iowa, ', 11, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2FIntegrated%20Medical%20Curriculum%2Epdf&parent=%2Fpersonal%2Fm', 'Education'),
(14, 'Islamic Psychology: Towards a 21st Century Definition and Conceptual Framework', 'Journal', 2018, 'Carrie York Al Karam', 'Carrie York Al Karam.png', 'English', 'University of Iowa', 'University of Iowa', 13, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2F%5B24685542%20%2D%20Journal%20of%20Islamic%20Ethics%5D%20Islam', 'Religion'),
(15, 'Transformation of Higher Education: A Stakeholder Perspectives in Private Islamic Higher Education Institution (IPTIS) in Malaysia', 'Journal', 2019, 'Hadijah, Ahmad', 'Hadijah, Ahmad.png', 'English', 'Kolej Pengajian Islam,Johor Bharu', 'Kolej Pengajian Isla', 15, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2F%5B20679785%20%2D%20HOLISTICA%20%E2%80%93%20Journal%20of%20Bus', 'Education'),
(16, 'INTEGRASI ILMU NAQLI DAN AQLI DALAM SISTEM PENTADBIRAN: PENGHAYATAN DI KALANGAN WARGA UNIVERSITI SAINS ISLAM MALAYSIA (USIM)', 'Research paper', 2010, 'Rozaimi et al', 'Rozaimi et al.png', 'Malay', 'USIM', 'USIM', 11, '1', 'https://raudahusim-my.sharepoint.com/:w:/g/personal/muazz_usim_edu_my/EW5gVHOCmapJu5o_XicS4qYBblMwCOkwCFpHxaniW5T7HA?e=lahDrO', 'History & Philosophy'),
(17, 'FOODS & BEVERAGES IN ISLAMIC & SCIENCE PERSPECTIVES', 'Book', 2016, 'Abdul Jalil Abdul Kader et al', 'Abdul Jalil Abdul Kader et al.png', 'English', 'USIM', 'Penerbit USIM', 126, '1', 'http://mybookstore.usim.edu.my/index.php?route=product/product&path=36&product_id=485', 'Science'),
(18, 'CHEMISTRY OF FOOD, HEALTH AND TECHNOLOGY IN ISLAMIC CITATIONS', 'Book', 2016, 'Farah Wahida Harun et al', 'Farah Wahida Harun et al.png', 'English', 'USIM', 'Pener', 157, '1', 'http://mybookstore.usim.edu.my/index.php?route=product/product&path=36&product_id=472', 'Science'),
(19, 'THE INTEGRATION OF NAQLI AND AQLI IN INFORMATION SECURITY AND ASSURANCE FROM THE ISLAMIC & TECHNOLOGICAL PERSPECTIVES', 'Book', 2015, 'Sakinah Ali Pitchay', 'Sakinah Ali Pitchay.png', 'English', 'USIM', 'Pener', 100, '1', 'http://mybookstore.usim.edu.my/index.php?route=product/product&product_id=593', 'Science'),
(20, 'KONSEP DAN PENDEKATAN INTEGRATIF DALAM PENDIDIKAN NASIONAL DAN PENDIDIKAN ISLAM', 'Journal', 2018, 'Muhammad Zein, Aizan', 'Muhammad Zein, Aizan.png', 'Malay', 'UM', 'UM', 15, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2FKONSEP%20DAN%20PENDEKATAN%20INTEGRATIF%20DALAM%20PENDIDIKAN%20', 'Education'),
(21, 'ISLAMISASI NEGARA MALAYSIA DALAM KONTEKS GAGASAN ISLAMISASI ILMU SYED MUHAMMAD NAQUIB AL-‘ATTAS: SATU TINJAUAN', 'Journal', 2017, 'Adam, Mohd Firdaus', 'Adam, Mohd Firdaus.png', 'Malay', 'KUIM', 'KUIM', 15, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2FISLAMISASI%20NEGARA%20MALAYSIA%20DALAM%20KONTEKS%20AL%2DATTAS%', 'Religion'),
(25, 'Islamization of Isma\'il Raji al-Faruqi\'s Knowledge', 'Research paper', 2018, 'Rodliyah Khuza’I et al', 'Rodliyah Khuza’I et al.png', 'English', 'Universitas Islam Bandung', 'Universitas Islam Ba', 4, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2FIslamization%20of%20Isma%27il%20Raji%20al%2DFaruqi%27s%20Knowl', 'Religion'),
(26, 'Registered Medersas in Mali: Effectively Integrating Islamic and Western Educational Epistemologies in Practice', 'Journal', 2019, 'HELEN N. BOYLE', 'HELEN N. BOYLE.png', 'English', 'University of Chicago', 'University of Chicag', 21, '1', 'https://raudahusim-my.sharepoint.com/personal/muazz_usim_edu_my/_layouts/15/onedrive.aspx?id=%2Fpersonal%2Fmuazz%5Fusim%5Fedu%5Fmy%2FDocuments%2FQAPEX%2FPENERBITAN%20INAQ%2Fdari%20Dr%20anuar%2FRegistered%20Medersas%20in%20Mali%3B%20Effectively%20Integrati', 'Education'),
(27, 'Epistemological Integration Essentials of an Islamic Methodology', 'Book', 2015, 'Fathi Hasan Malkawi', 'Fathi Hasan Malkawi.png', 'English', 'The International Institute of Islamic Thought (IIIT)', 'IIIT London', 53, '1', 'https://iiit.org/wp-content/uploads/2018/07/bib_epistemological_integration_combined.pdf', 'History & Philosophy'),
(28, 'Stagnant of Epistemological Aspect In Islamic Education Studies: Critical Studies In Bayani, Burhani, And Irfani', 'Book', 2017, 'Laila Ngindana Zulfa, UlyaHimawati', 'Laila Ngindana Zulfa, UlyaHimawati.png', 'English', 'Faculty of Islamic Studies Universitas Wahid', 'Faculty of Islamic S', 8, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EazUhYak1BpFpkio8ddBynYB0OQYKJ_xQDgf3MrZzC5qcQ?e=2jXkN1', 'Science'),
(29, 'Islamisasi Pemikiran Pembangunan', 'Book', 2013, 'Muhammad Syukri Salleh', 'Muhammad Syukri Salleh.png', 'Malay', 'USIM', 'Penerbit USIM', 14, '5', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EWpSSW4V4ItJo3YmZb37lZ8B80pA2uD9bFkgpDjSyFGHVA?e=buhABF', 'Science'),
(30, 'The Integration of Islam and Science: Al-Ghazali on Causality The Integration of Islam and Science: Al-Ghazali on Causality Revisited', 'Book', 2015, 'Mohd Radhi Ibrahim', 'Mohd Radhi Ibrahim.png', 'English', 'USIM', 'Penerbit USIM', 9, '15', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EZCueC8KuMFAjw3NKxb18XkB7xqCHxpM_i6pqT8euZckOQ?e=nhTCY1', 'Science'),
(31, 'Dewesternisasi Ilmu', 'Book', 2010, 'Syed Muhammad Naquib Al-Attas', 'Syed Muhammad Naquib Al-Attas.png', 'Malay', 'UKM', 'UKM', 20, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EVuyrIYH-WhOgA7QE5ammyABzuaCV-JLBnKEZ6r4tq4OuA?e=6Bukof', 'Science'),
(32, 'Antara Akal Dan Wahyu Dari Perspektif Islam', 'Book', 2012, 'Maad Ahmad et al', 'Maad Ahmad et al.png', 'Malay', 'KUIS', 'KUIS', 11, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EX3k-wciArxJnIc2APu61boBvob7-gDFyyD3MGFAh8hunA?e=vzf9mP', 'Science'),
(33, 'The Quran And Modern Science', 'Book', 1980, 'DR Maurice Bucaille', 'DR Maurice Bucaille.png', 'English', 'French Acadamy Of Medicine', 'French Acadamy Of Me', 22, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/Ebhv99EbRF1PlrhafqU2zhYBtOVq1IZpdLjVKOd0M-7_QA?e=UPnin0', 'Science'),
(34, 'Islamisasi Dan Kaitannya Dengan Hubungan Serantau Malaysia – Indonesia', 'Journal', 2017, 'Mashitah Sulaiman et al ', 'Mashitah Sulaiman et al .png', 'Malay', 'UM', 'UM', 27, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EV1Q3qxXvKpPj2dUmmFvfxkB-jmG0OPNE0JgC-FY6X_bTA?e=sxQadw', 'Religion'),
(35, 'IIUM Policies & Guidelines on Islamisation', 'Book', 2013, 'Prof. Dato Sri Dr. Zaleha Kamaruddin', 'Prof. Dato Sri Dr. Zaleha Kamaruddin.png', 'English', 'IIUM', 'Published in Malaysi', 48, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EQdvX6c-AKtPsmEUrNInkpsBQ6Ka950LB2lSldBVJzXAQg?e=6cVvR8', 'Religion'),
(36, 'Knowledge Triumphant	', 'Book', 2007, 'Franz Rosenthal', 'Franz Rosenthal.png', 'English', 'Library of Congress Cataloging-in-Publication Data', 'Library of Congress ', 355, '2', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EV-bxKha5ftKpMo7T1mAQKwBEehivBlHBtxyUci_SxsDZA?e=DQkGfh', 'Education'),
(37, 'Model-Model Integrasi Ilmu Dan Upaya Membangun Landasan Keilmuan Islam', 'Journal', 2011, 'Huzni Thoyyar', 'Huzni Thoyyar.png', 'Malay', 'UIN', 'UIN', 30, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EQz6-aFTIlNKmxr41sn1JVgBxy7J9ZQb8Vh74yim0qFMPw?e=yNesWM', 'Religion'),
(38, 'Pendidikan Rohani Berasaskan Sains Al-Quran', 'Journal', 2017, 'Mohd Fuad Othman et al', 'Mohd Fuad Othman et al.png', 'Malay', 'UKM', 'UKM', 77, '1', 'http://spaj.ukm.my/acerj/index.php/acer-j/article/view/8/15', 'Religion'),
(39, 'Pengislaman Sains Dan Pengaruhnya Dalam Peradaban: Respons Ilmuwan Muslim Terpilih', 'Journal', 2019, 'Mahadi Abu Hasan et al', 'Mahadi Abu Hasan et al.png', 'Malay', 'UTEM, UM', 'UTEM, UM', 150, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EdtSDBH5asxCqc4VqdQub84BUckq_yB7oC_DWlgt12GhfQ?e=YcuGXA', 'Education'),
(40, 'The Qur’aan And Modern Science, Compatible or Incompatible?', 'Book', 2000, 'Dr. Zakir Naik', 'Dr. Zakir Naik.png', 'English', 'Islamic Research Foundation', 'AHYA Mulyi-Media', 48, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EVrbaqp1X9FFvzsOik1I18EBTwbRwCcmtkkoEMjGjoIx_Q?e=mCMivZ', 'Science'),
(41, 'Sains Dan Teknologi Dalam Al-Qur’an Dan Implikasinya Dalam Pembelajaran', 'Journal', 2010, 'Jamal Fakhri', 'Jamal Fakhri.png', 'Malay', 'Fakultas Tarbiyah IAIN Raden Intan Lampung', 'Fakultas Tarbiyah IA', 142, '15', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EXDSxG3133NEhVPUOJzEhEoB47yE2tAMbL3iclmHxAd_zQ?e=Y71HsN', 'Science'),
(42, 'Islamic Science and Some Physico-Philosophical Thoughts From a Mathematical Physics Point of View', 'Journal', 2011, 'Zainal Abdul Aziz', 'Zainal Abdul Aziz.png', 'English', 'USIM', 'USIM', 80, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EU5QDXIwqVBBgp5pdYJLG8YBAE8nXZYHdS-Vs1NpfzfCFA?e=LuFv2C', 'Science'),
(43, 'Al-Tawhid Its Implication for Thought and Life', 'Book', 1995, 'Ismail Raji al Daruqieng', 'Ismail Raji al Daruqieng.png', 'English', 'International Islamic Thoght', 'International Islami', 241, '4', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/Ebhrl9Oe7U9BnZtA-9nEaCABxq14PoiK-9wrtx87WRmrWA?e=D2rStH', 'Religion'),
(44, 'Risalah Untuk Kaum Muslimin', 'Book', 2001, 'Syed Muhammad Naquib Al-Attas', 'Syed Muhammad Naquib Al-Attas.png', 'Malay', 'Institut Antarabangsa Pemikiran Dan Tamadun Islam', 'Institut Antarabangs', 209, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EZQl6Q9HRDJLqAuGuaqNrtgBaieEcABW41Up-Q1S3aZl0g?e=djSMly', 'Religion'),
(45, 'Juhud ‘Ulama’ al-Muslimin fi Taqaddum al-Hadarah', 'Book', 2004, 'Khalid bin Sulaiman', 'Khalid bin Sulaiman.png', 'Arabic', 'King  Fahd Library', 'King  Fahd Library', 532, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EQ-swSFZ5P5Jqy5PCA-VUTAB5GXn8ocFGR2x-HSm95QwFA?e=zqgYeS', 'Religion'),
(46, 'Konsep Ilmu menurut Perspektif Syed Sheikh Ahmad al-Hadi', 'Journal', 2016, 'Adibah Sulaiman', 'Adibah Sulaiman.png', 'Malay', 'UKM', 'UKM', 10, '1', 'http://journalarticle.ukm.my/10755/1/16918-53157-1-PB.pdf', 'Education'),
(169, 'Al-Ilmaniyyun wa al-Quran_Ahmad Idris al-Ta’an', 'Book', 2007, 'Dr Nuruddin & Dr Umarah', 'Dr Nuruddin & Dr Umarah.png', 'Arabic', 'King  Fahd Library', 'King  Fahd Library', 887, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/Edas39hKgMNBueXsxZ5yP_gBGoD8riRJuvMwp2LQYhY1vg?e=5j9yiS', 'Religion'),
(170, 'Dewesternizing & Islamizing the Sciences: Operationalizing the Neo-Ghazalian, Attasian Vision', 'Journal', 2008, 'Dr. Adi Setia', 'Dr. Adi Setia.png', 'English', 'HAKIM and Curiosity Institute', 'HAKIM and Curiosity ', 30, '1', 'http://waqfacademy.org/wp-content/uploads/2013/03/Dr.-Adi-Setia-AS.-24_07_2010.-De-westernizing-Islamizing-the-sciences.-Malaysia.-HAKIM.pdf', 'Science'),
(171, 'Islamization of Human Sciences: Need, Prospects and Challenges', 'Journal', 2017, 'Adeela Rahman', 'Adeela Rahman.png', 'English', 'IIUM', 'IIUM', 8, '4', 'https://www.unisza.edu.my/icic2017/images/46_Adeela_Rahman__Islamization_of_Human_Sciences_Need_Prospects_and_Challenges.pdf', 'Religion'),
(172, 'Strategizing Islamic Education', 'Journal', 2013, 'Muhammad Syukri Salleh', 'Muhammad Syukri Salleh.png', 'English', 'USM', 'USM', 14, '1', 'http://www.ijern.com/journal/June-2013/13.pdf', 'Education'),
(173, 'Wacana Integrasi Ilmu-Ilmu Naqli Dan Aqli Dalam Muqaddimah ibn Khaldun', 'Journal', 2018, 'Wan Mohd Fazrul Azdi Wan Razali', 'Wan Mohd Fazrul Azdi Wan Razali.png', 'Malay', 'USIM', 'Penerbit USIM', 17, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EUkUUJ6XLnlHn4dn8lerCWkB5YjqKTkmNOviQ4iRp1QCvw?e=uaOgjM', 'Education'),
(174, 'Integrasi Ilmu Naqli dan Aqli di dalam Sistem Pengurusan Keselamatan: Kajian Pelaksanaan Pengurusan Konvensional dan Pengurusan Islam', 'Journal', 2018, 'Rozaimi Kamaruddin', 'Rozaimi Kamaruddin.png', 'Malay', 'USIM', 'Penerbit USIM', 18, '1', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EX-k-hq3fbhGjtZeAPZ_aMwBjPJLXyAHQFsSO_OaaCD48w?e=ZaIkUs', 'Education'),
(175, 'Konsep Integrasi Ilmu Naqli Dan Aqli Dan Perbandingannya Dengan Islamisasi', 'Journal', 2018, 'Mahyuddin Hashim', 'Mahyuddin Hashim.png', 'Malay', 'USIM', 'Penerbit USIM', 14, '2', 'http://jqss.usim.edu.my/index.php/jqss/article/view/22/23', 'Education'),
(176, 'Integrasi Naqli dan Aqli dalam Pengajaran Bahasa Arab Tujuan Khas di Universiti Sains Islam Malaysia', 'Journal', 2018, 'Yuslina Mohamed', 'Yuslina Mohamed.png', 'Malay', 'USIM', 'Penerbit USIM', 10, '2', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/EXSE4oZiS9xLsSh8AJUIAhUBBBWCzVoRt0xwiRmvn-F4aQ?e=zj1aFN', 'Religion'),
(177, 'Kepentingan Integrasi Ilmu Naqli Dan Ilmu Aqli Dalam Pengajaran Pendidikan Islam', 'Journal', 2015, 'Zetty Nurzuliana', 'Zetty Nurzuliana.png', 'Malay', 'E-Jurnal Pendidikan', 'E-Jurnal Pendidikan', 10, '2', 'https://raudahusim-my.sharepoint.com/:b:/g/personal/muazz_usim_edu_my/ERJs-d9ou_9FqBF7QDXXaroBpU0v3oaBqswD-ZD7mCgqtQ?e=JchHji', 'Religion');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publication`
--
ALTER TABLE `publication`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `publication`
--
ALTER TABLE `publication`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
