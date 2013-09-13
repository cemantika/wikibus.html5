CREATE DATABASE  IF NOT EXISTS `wikibus` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `wikibus`;
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tempo de Geração: 
-- Versão do Servidor: 5.5.28
-- Versão do PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `wikibus`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `empresa`
--

INSERT INTO `empresa` (`id_empresa`, `nome`) VALUES
(1, 'Vitral'),
(2, 'Joevanza'),
(3, 'Barramar'),
(4, 'BTU'),
(5, 'Central'),
(6, 'Axe'),
(7, 'Boa Viagem'),
(8, 'Modelo'),
(9, 'Ilha Tropical'),
(10, 'Transol'),
(11, 'Rio Vermelho'),
(12, 'Ondina'),
(13, 'asd'),
(14, 'asd');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itinerario`
--

CREATE TABLE IF NOT EXISTS `itinerario` (
  `id_linha` int(11) NOT NULL,
  `id_ponto` int(11) NOT NULL,
  `id_ponto_anterior` int(11) DEFAULT NULL,
  `data_atualizacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sequencia` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_linha`,`id_ponto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `itinerario`
--

INSERT INTO `itinerario` (`id_linha`, `id_ponto`, `id_ponto_anterior`, `data_atualizacao`, `sequencia`) VALUES
(1, 1, 0, '2012-11-29 14:59:59', 1),
(1, 3, 1, '2012-11-29 15:00:02', 2),
(1, 2, 4, '2012-11-29 18:11:27', 58),
(1, 4, 6, '2012-11-29 18:11:24', 57),
(1, 5, 3, '2012-11-29 15:00:04', 3),
(1, 6, 8, '2012-11-29 18:11:20', 56),
(1, 7, 5, '2012-11-29 15:00:05', 4),
(1, 8, 16, '2012-11-29 18:11:19', 55),
(1, 9, 7, '2012-11-29 15:00:07', 5),
(1, 10, 9, '2012-11-29 15:00:11', 6),
(1, 11, 10, '2012-11-29 15:00:14', 7),
(1, 12, 11, '2012-11-29 15:00:16', 8),
(1, 13, 12, '2012-11-29 15:00:20', 9),
(1, 16, 15, '2012-11-29 18:11:12', 54),
(1, 14, 13, '2012-11-29 15:00:23', 10),
(1, 15, 17, '2012-11-29 18:10:50', 53),
(1, 19, 14, '2012-11-29 15:00:30', 11),
(1, 22, 19, '2012-11-29 15:00:34', 12),
(1, 23, 1, '2012-11-29 15:02:33', 13),
(1, 25, 2, '2012-11-29 15:02:37', 14),
(1, 30, 3, '2012-11-29 15:02:38', 15),
(1, 35, 30, '2012-11-29 17:59:33', 16),
(1, 37, 35, '2012-11-29 17:59:46', 17),
(1, 39, 37, '2012-11-29 17:59:49', 18),
(1, 41, 39, '2012-11-29 17:59:51', 19),
(1, 43, 41, '2012-11-29 17:59:54', 20),
(1, 45, 43, '2012-11-29 17:59:57', 21),
(1, 46, 45, '2012-11-29 18:00:22', 22),
(1, 48, 46, '2012-11-29 18:00:37', 23),
(1, 132, 48, '2012-11-29 18:00:41', 24),
(1, 133, 132, '2012-11-29 18:00:42', 25),
(1, 134, 133, '2012-11-29 18:00:48', 26),
(1, 135, 134, '2012-11-29 18:00:49', 27),
(1, 136, 135, '2012-11-29 18:00:55', 28),
(1, 137, 136, '2012-11-29 18:00:56', 29),
(1, 138, 137, '2012-11-29 18:01:02', 30),
(1, 139, 138, '2012-11-29 18:01:04', 31),
(1, 140, 139, '2012-11-29 18:01:05', 32),
(1, 141, 140, '2012-11-29 18:01:09', 33),
(1, 47, 141, '2012-11-29 18:01:12', 34),
(1, 44, 47, '2012-11-29 18:01:15', 35),
(1, 42, 44, '2012-11-29 18:01:16', 36),
(1, 40, 42, '2012-11-29 18:01:19', 37),
(1, 38, 40, '2012-11-29 18:01:21', 38),
(1, 34, 38, '2012-11-29 18:01:36', 39),
(1, 31, 34, '2012-11-29 18:01:41', 40),
(1, 27, 31, '2012-11-29 18:01:47', 41),
(1, 143, 27, '2012-11-29 18:09:42', 42),
(1, 144, 143, '2012-11-29 18:09:43', 43),
(1, 24, 144, '2012-11-29 18:10:02', 44),
(1, 21, 24, '2012-11-29 18:10:10', 45),
(1, 20, 21, '2012-11-29 18:10:12', 46),
(1, 18, 20, '2012-11-29 18:10:15', 47),
(1, 101, 18, '2012-11-29 18:10:19', 48),
(1, 103, 101, '2012-11-29 18:10:21', 49),
(1, 104, 103, '2012-11-29 18:10:23', 50),
(1, 102, 104, '2012-11-29 18:10:24', 51),
(1, 17, 102, '2012-11-29 18:10:29', 52),
(2, 1, 0, '2012-11-29 21:35:54', 1),
(2, 3, 1, '2012-11-29 21:35:55', 2),
(2, 5, 3, '2012-11-29 21:35:59', 3),
(2, 7, 5, '2012-11-29 21:36:02', 4),
(2, 9, 7, '2012-11-29 21:36:05', 5),
(2, 10, 9, '2012-11-29 21:36:08', 6),
(2, 75, 10, '2012-11-29 21:36:13', 7),
(2, 77, 75, '2012-11-29 21:36:14', 8),
(2, 79, 77, '2012-11-29 21:36:17', 9),
(2, 82, 79, '2012-11-29 21:36:20', 10),
(2, 83, 82, '2012-11-29 21:36:22', 11),
(2, 85, 83, '2012-11-29 21:36:25', 12),
(2, 87, 85, '2012-11-29 21:36:28', 13),
(2, 89, 87, '2012-11-29 21:36:29', 14),
(2, 91, 89, '2012-11-29 21:36:35', 15),
(2, 94, 91, '2012-11-29 21:36:55', 16),
(2, 96, 94, '2012-11-29 21:36:59', 17),
(2, 98, 96, '2012-11-29 21:37:09', 18),
(3, 1, NULL, '2013-01-24 19:59:50', NULL),
(3, 3, NULL, '2013-01-24 19:59:58', NULL),
(3, 5, NULL, '2013-01-24 20:00:00', NULL),
(2, 54, NULL, '2013-01-24 20:27:36', NULL),
(4, 1, NULL, '2013-01-24 21:03:38', NULL),
(10, 49, NULL, '2013-03-27 23:13:54', NULL),
(7, 55, NULL, '2013-01-25 03:15:39', NULL),
(5, 1, NULL, '2013-01-24 21:47:44', NULL),
(5, 3, NULL, '2013-01-24 21:47:45', NULL),
(5, 5, NULL, '2013-01-24 21:47:47', NULL),
(5, 7, NULL, '2013-01-24 21:47:52', NULL),
(2, 57, NULL, '2013-03-27 06:42:36', NULL),
(7, 54, NULL, '2013-01-25 02:40:00', NULL),
(7, 52, NULL, '2013-01-25 02:40:03', NULL),
(7, 50, NULL, '2013-01-25 02:40:08', NULL),
(8, 55, NULL, '2013-01-25 03:16:04', NULL),
(8, 54, 52, '2013-01-25 02:47:39', 3),
(8, 52, 50, '2013-01-25 02:47:36', 2),
(8, 50, 0, '2013-01-25 02:47:34', 1),
(8, 57, 55, '2013-01-25 02:47:45', 5),
(8, 60, 57, '2013-01-25 02:47:49', 6),
(8, 62, 60, '2013-01-25 02:48:03', 7),
(13, 49, NULL, '2013-03-27 23:13:57', NULL),
(11, 49, NULL, '2013-03-27 23:14:19', NULL),
(9, 49, NULL, '2013-03-27 23:14:55', NULL),
(12, 49, NULL, '2013-03-27 23:17:20', NULL),
(7, 49, NULL, '2013-03-27 23:18:37', NULL),
(14, 10, 0, '2013-03-27 23:26:06', 1),
(14, 11, 10, '2013-03-27 23:26:07', 2),
(14, 12, 11, '2013-03-27 23:26:08', 3),
(14, 13, 12, '2013-03-27 23:26:11', 4),
(14, 14, 13, '2013-03-27 23:26:14', 5),
(14, 19, 14, '2013-03-27 23:26:17', 6),
(14, 22, 19, '2013-03-27 23:26:18', 7),
(14, 23, 22, '2013-03-27 23:26:21', 8),
(14, 25, 23, '2013-03-27 23:26:27', 9),
(14, 30, 25, '2013-03-27 23:26:38', 10),
(14, 35, 30, '2013-03-27 23:26:40', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `linha`
--

CREATE TABLE IF NOT EXISTS `linha` (
  `id_linha` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `origem` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `destino` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `via` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'R1, R2, Via Jorge Amado...',
  PRIMARY KEY (`id_linha`),
  UNIQUE KEY `id_linha` (`id_linha`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=17 ;

--
-- Extraindo dados da tabela `linha`
--

INSERT INTO `linha` (`id_linha`, `numero`, `origem`, `destino`, `via`) VALUES
(1, '1102', 'Cabula VI', 'Lapa', 'Rodoviaria'),
(2, '1130', 'Cabula VI', 'Ondina', 'Ladeira da Montanha'),
(3, '1234', 'Cabula', 'Sieiro', 'Dique'),
(4, '1141', 'Costa Azul', 'Barra', 'Av. ACM'),
(5, '1215', 'Engomadeira', 'Lapa', 'Centro Historico'),
(6, '1306', 'Santa Monica', 'Lapa', 'Rodoviaria'),
(7, '1129', 'Cabula VI', 'Pituba', 'Boca do Rio'),
(8, '1122', 'Costa Azul', 'Itaigara', 'Iguatemi'),
(9, '0102', 'Barbalho', 'Iguatemi', ''),
(10, '0118', 'Lapa', 'CAB', 'Iguatemi'),
(11, '1137', 'Pernambues', 'Lapa', 'Rodoviaria'),
(12, '1224', 'Arenoso', 'Pituba', 'Paulo VI'),
(13, '1320', 'Pau da Lima', 'Nordeste', ''),
(14, '1125', 'Doron', 'Barra R1', ''),
(15, '1', '', '', ''),
(16, '1020', 'Cabula', 'Su00e3o Joaquim', 'Casa de Denildo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `onibus`
--

CREATE TABLE IF NOT EXISTS `onibus` (
  `id_onibus` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `adaptado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_onibus`),
  UNIQUE KEY `id_onibus` (`id_onibus`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `onibus`
--

INSERT INTO `onibus` (`id_onibus`, `id_empresa`, `numero`, `adaptado`) VALUES
(1, 6, '3371', 0),
(2, 6, '3371', 0),
(3, 8, '8852', 1),
(4, 3, '2552', 1),
(5, 6, '5555', 0),
(6, 5, '4444', 1),
(7, 13, '8765', 1),
(8, 6, '8855', 1),
(9, 3, '8888', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto`
--

CREATE TABLE IF NOT EXISTS `ponto` (
  `id_ponto` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` float(20,15) DEFAULT NULL,
  `longitude` float(20,15) DEFAULT NULL,
  `numero` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logradouro` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pais` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referencia` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_ponto`),
  UNIQUE KEY `id_ponto` (`id_ponto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=307 ;

--
-- Extraindo dados da tabela `ponto`
--

INSERT INTO `ponto` (`id_ponto`, `latitude`, `longitude`, `numero`, `logradouro`, `bairro`, `cidade`, `estado`, `pais`, `cep`, `referencia`) VALUES
(1, -12.956977844238281, -38.437461853027344, '357-399', 'R. Teu00f3dulo Albuquerque', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41181-010', 'Final de linha do Cabula VI'),
(2, -12.957001686096191, -38.437622070312500, '358-400', 'R. Teu00f3dulo Albuquerque', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41181-010', 'Final de linha do Cabula VI'),
(3, -12.955123901367188, -38.437320709228516, '76-202', 'R. Teu00f3dulo Albuquerque', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41181-010', 'Colegio Estadual Elisabeth Chaves Veloso'),
(4, -12.955617904663086, -38.437294006347656, '204-250', 'R. Teu00f3dulo Albuquerque', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41181-010', 'Colegio Estadual Elisabeth Chaves Veloso'),
(5, -12.954258918762207, -38.438247680664060, '2-74', 'R. Teu00f3dulo Albuquerque', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41181-010', 'Igreja Catolica / Flor do Cabula / Shopping Alto da Cachoeirinha'),
(6, -12.954336166381836, -38.438652038574220, '2-74', 'R. Teu00f3dulo Albuquerque', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41181-010', 'Igreja Catolica / Flor do Cabula / Shopping Alto da Cachoeirinha'),
(7, -12.955015182495117, -38.440967559814450, '2-106', 'R. A', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '', 'Modulo Policial'),
(8, -12.954824447631836, -38.440799713134766, '1-105', 'R. A', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '', 'Modulo Policial'),
(9, -12.955087661743164, -38.443523406982420, '1003-1051', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', ''),
(10, -12.952863693237305, -38.447841644287110, '2-36', 'R. u00c1guas Cristalinas', 'Tancredo Neves', 'Salvador', 'Bahia', 'BR', '41207-598', 'Hospital Juliano Moreira'),
(11, -12.954390525817871, -38.445564270019530, '670-896', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', ''),
(12, -12.956196784973145, -38.443367004394530, '1024-1104', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', ''),
(13, -12.960522651672363, -38.439876556396484, '1518-1522', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', 'Entrada do Doron'),
(14, -12.962017059326172, -38.437759399414060, '1550-1898', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', 'Coelba'),
(15, -12.961907386779785, -38.437442779541016, '1773-1795', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', 'Coelba'),
(16, -12.959455490112305, -38.440078735351560, '1449-1503', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', 'Conder'),
(17, -12.961834907531738, -38.434741973876950, '2115-2273', 'Av. Luiz Viana Filho', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41745-010', 'Passarela Odebrecht / Extra'),
(18, -12.961792945861816, -38.432952880859375, '2280-2338', 'Av. Luiz Viana Filho', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '', 'Passarela Extra Paralela / Odebrecht'),
(19, -12.966983795166016, -38.439041137695310, '1933', 'Av. Luiz Viana Filho', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41745-010', 'Passarela Tribunal de Contas'),
(20, -12.966890335083008, -38.437614440917970, '2052-2150', 'Av. Luiz Viana Filho', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '', 'Passarela FBE (Fundau00e7u00e3o Bahiana de Engenharia) / Posto Gabriela'),
(21, -12.968441963195800, -38.439048767089844, '', 'Acesso para Av Luiz Viana Filho', 'Paralela', 'Salvador', 'Bahia', 'BR', '', 'Entrada do Imbui / Posto Gabriela'),
(22, -12.968391418457031, -38.441455841064450, '1721-1865', 'Av. Luiz Viana Filho', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41745-010', 'Condominio Amazonia / Shopping Amazonia / Empresarial Paralela Shopping'),
(23, -12.975154876708984, -38.453334808349610, '', 'Av. Luiz Viana Filho', 'Pernambuu00e9s', 'Salvador', 'Bahia', 'BR', '', 'Passarela Grande Bahia / Hospital Sarah'),
(24, -12.974995613098145, -38.451679229736330, '', 'Av. Luiz Viana Filho', 'Pernambuu00e9s', 'Salvador', 'Bahia', 'BR', '', 'Passarela Hospital Sarah / Grande Bahia'),
(25, -12.975426673889160, -38.460948944091800, '3380-3430', 'Av. Tancredo Neves', 'Pernambuu00e9s', 'Salvador', 'Bahia', 'BR', '41820-021', 'Madeireira Brotas'),
(26, -12.975540161132812, -38.460834503173830, '', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Madeireira Brotas'),
(27, -12.975684165954590, -38.460655212402344, '', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Madeireira Brotas'),
(28, -12.975790023803711, -38.460319519042970, '', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-021', 'Madeireira Brotas'),
(29, -12.975687026977539, -38.459918975830080, '', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-021', 'Madeireira Brotas'),
(30, -12.978853225708008, -38.465660095214844, '', '', 'Pernambuu00e9s', 'Salvador', 'Bahia', 'BR', '', 'Estau00e7u00e3o Rodoviaria'),
(31, -12.979057312011719, -38.464332580566406, '', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Estau00e7u00e3o Transbordo Iguatemi'),
(32, -12.979273796081543, -38.464107513427734, '', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '', 'Estau00e7u00e3o Transbordo Iguatemi'),
(33, -12.978997230529785, -38.462894439697266, '360-438', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Empresarial Iguatemi'),
(34, -12.978333473205566, -38.471233367919920, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '', 'Passarela Detran'),
(35, -12.977823257446289, -38.471000671386720, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-000', 'Passarela Detran'),
(36, -12.978377342224121, -38.472251892089844, '5421-5697', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '40280-000', 'Passarela Detran'),
(37, -12.981121063232422, -38.482238769531250, '2165-2217', 'Av. Mu00e1rio Leal Ferreira', 'Cosme de Farias', 'Salvador', 'Bahia', 'BR', '40252-390', 'Passarela Bonocu00f4'),
(38, -12.981216430664062, -38.481697082519530, '2350-2522', 'Av. Mu00e1rio Leal Ferreira', 'Brotas', 'Salvador', 'Bahia', 'BR', '40285-600', 'Passarela Bonocu00f4'),
(39, -12.984156608581543, -38.484859466552734, '15-39', 'R. Baianinha', 'Cosme de Farias', 'Salvador', 'Bahia', 'BR', '40253-420', 'Passarela Cresauto'),
(40, -12.984742164611816, -38.484672546386720, '1614-2010', 'Av. Mu00e1rio Leal Ferreira', 'Brotas', 'Salvador', 'Bahia', 'BR', '40285-600', 'Passarela Cresauto'),
(41, -12.983881950378418, -38.488174438476560, '', 'Acesso para R Nova do Sossego', 'Cosme de Farias', 'Salvador', 'Bahia', 'BR', '', ''),
(42, -12.984424591064453, -38.488105773925780, '1-83', 'Av. Jurema', 'Daniel Lisboa', 'Salvador', 'Bahia', 'BR', '40284-330', ''),
(43, -12.983222961425781, -38.491596221923830, '869-1035', 'Av. Mu00e1rio Leal Ferreira', 'Daniel Lisboa', 'Salvador', 'Bahia', 'BR', '40252-390', ''),
(44, -12.984030723571777, -38.490943908691406, '356-1158', 'Av. Mu00e1rio Leal Ferreira', 'Daniel Lisboa', 'Salvador', 'Bahia', 'BR', '40284-320', ''),
(45, -12.980998992919922, -38.495731353759766, '', 'Av. Mu00e1rio Leal Ferreira', 'Cosme de Farias', 'Salvador', 'Bahia', 'BR', '40252-390', 'Posto BR'),
(46, -12.979332923889160, -38.499446868896484, '1-435', 'Av. Mu00e1rio Leal Ferreira', 'Cosme de Farias', 'Salvador', 'Bahia', 'BR', '40252-390', ''),
(47, -12.979921340942383, -38.498905181884766, '', 'Av. Mu00e1rio Leal Ferreira', 'Engenho Velho de Bro', 'Salvador', 'Bahia', 'BR', '40241-000', ''),
(48, -12.980913162231445, -38.504489898681640, '217-547', 'R. Lions Club', 'Nazaru00e9', 'Salvador', 'Bahia', 'BR', '40050-568', 'Arena Fonte Nova'),
(49, -12.981043815612793, -38.465370178222656, '', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Shopping Iguatemi'),
(50, -12.984279632568360, -38.466953277587890, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41215-400', 'Hiper Bom Preu00e7o / Igreja Universal'),
(51, -12.985198020935059, -38.466724395751950, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41215-400', 'Hiper Bom Preu00e7o'),
(52, -12.988074302673340, -38.468574523925780, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Hiper Posto'),
(53, -12.988493919372559, -38.468658447265625, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Hiper Posto'),
(54, -12.988970756530762, -38.470973968505860, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Cidadela / Porto Seguro'),
(55, -12.991251945495605, -38.474685668945310, '2901-3045', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Parque Bela Vista', 'Salvador', 'Bahia', 'BR', '40280-000', 'Comercial Ramos'),
(304, -12.991503715515137, -38.474403381347656, '', 'Avenida Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Hospital Teresa de Lisieux'),
(57, -12.996555328369140, -38.478218078613280, '', 'Av. Juracy Magalhu00e3es Ju00fanior', 'Candeal', 'Salvador', 'Bahia', 'BR', '40295-140', 'Cidade Jardim'),
(58, -12.996526718139648, -38.476829528808594, '2442-2694', 'Av. Juracy Magalhu00e3es Ju00fanior', 'Santa Cruz', 'Salvador', 'Bahia', 'BR', '41926-000', ''),
(59, -13.000245094299316, -38.481060028076170, '', 'Av. Juracy Magalhu00e3es Ju00fanior', 'Santa Cruz', 'Salvador', 'Bahia', 'BR', '41926-000', 'Hospital Alianu00e7a'),
(60, -12.999625205993652, -38.481655120849610, '', 'Av. Juracy Magalhu00e3es Ju00fanior', 'Candeal', 'Salvador', 'Bahia', 'BR', '40295-140', 'Hospital Alianu00e7a'),
(61, -13.002158164978027, -38.482528686523440, '1502-1526', 'Av. Juracy Magalhu00e3es Ju00fanior', 'Santa Cruz', 'Salvador', 'Bahia', 'BR', '41926-000', 'CEASA Rio Vermelho'),
(62, -13.002376556396484, -38.483394622802734, '1501-1525', 'Av. Juracy Magalhu00e3es Ju00fanior', 'Horto Florestal', 'Salvador', 'Bahia', 'BR', '40295-140', 'CEASA Rio Vermelho'),
(63, -13.005235671997070, -38.486354827880860, '2-58', 'R. Des. Plu00ednio Guerreiro', 'Horto Florestal', 'Salvador', 'Bahia', 'BR', '40295-150', 'Embasa'),
(64, -13.006307601928711, -38.487243652343750, '566-636', 'R. Lucaia', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41940-660', ''),
(65, -12.996292114257812, -38.471008300781250, '1751-2245', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Pituba', 'Salvador', 'Bahia', 'BR', '', 'Parque da Cidade / Shopping Paseo'),
(66, -12.996057510375977, -38.470493316650390, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Shopping Paseo / Parque da Cidade'),
(67, -12.996495246887207, -38.467891693115234, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Petrobras'),
(68, -12.996302604675293, -38.466747283935550, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Tricenter'),
(69, -12.996711730957031, -38.465930938720700, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Shopping Itaigara'),
(70, -12.996747016906738, -38.464923858642580, '', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41215-400', 'Shopping Itaigara'),
(71, -12.997717857360840, -38.462860107421875, '482-860', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41800-700', 'Bradesco'),
(72, -12.998614311218262, -38.461952209472656, '317-377', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Pituba', 'Salvador', 'Bahia', 'BR', '40280-000', 'Clinica Delfin / Hospital Santa Clara'),
(73, -12.999802589416504, -38.459598541259766, '246-290', 'Av. Antu00f4nio Carlos Magalhu00e3es', 'Itaigara', 'Salvador', 'Bahia', 'BR', '41800-700', ''),
(74, -13.004133224487305, -38.459011077880860, '249-327', 'R. Rio Grande do Sul', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-141', ''),
(75, -12.958179473876953, -38.450302124023440, '1-169', 'Av. Edgard Santos', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41180-790', ''),
(76, -12.958009719848633, -38.450115203857420, '2-168', 'Av. Edgard Santos', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41180-790', ''),
(77, -12.958786964416504, -38.452396392822266, '688-918', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', 'Hospital Roberto Santos / Escola Bahiana de Medicina'),
(78, -12.958894729614258, -38.452529907226560, '869-977', 'R. Silveira Martins', 'Saboeiro', 'Salvador', 'Bahia', 'BR', '41150-000', 'Hospital Roberto Santos / Escola Bahiana de Medicina'),
(79, -12.957777023315430, -38.453815460205080, '1056-1348', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', 'Entrada Cabula 5'),
(80, -12.957900047302246, -38.453956604003906, '1115-1297', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', 'Entrada Cabula 5'),
(81, -12.955274581909180, -38.455669403076170, '1299-1507', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', ''),
(82, -12.955067634582520, -38.455612182617190, '1448-1472', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', ''),
(83, -12.953886032104492, -38.457828521728516, '1718-1844', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', ''),
(84, -12.954105377197266, -38.457702636718750, '1741-1807', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', ''),
(85, -12.952862739562988, -38.460037231445310, '1954-2080', 'R. Silveira Martins', 'Engomadeira', 'Salvador', 'Bahia', 'BR', '41150-000', 'UNEB'),
(86, -12.952944755554200, -38.460281372070310, '2077-2133', 'R. Silveira Martins', 'Narandiba', 'Salvador', 'Bahia', 'BR', '41150-000', 'UNEB'),
(87, -12.953567504882812, -38.461620330810550, '2160-2240', 'R. Silveira Martins', 'Su00e3o Gonu00e7alo', 'Salvador', 'Bahia', 'BR', '41150-000', 'Hiper Bom Preu00e7o Cabula'),
(88, -12.953560829162598, -38.461357116699220, '2203-2283', 'R. Silveira Martins', 'Su00e3o Gonu00e7alo', 'Salvador', 'Bahia', 'BR', '41150-000', 'Hiper Bom Preu00e7o Cabula'),
(89, -12.954287528991700, -38.463428497314450, '2424-2474', 'R. Silveira Martins', 'Su00e3o Gonu00e7alo', 'Salvador', 'Bahia', 'BR', '41150-000', 'Entrada do São Gonçalo'),
(90, -12.954317092895508, -38.463088989257810, '2385-2465', 'R. Silveira Martins', 'Su00e3o Gonu00e7alo', 'Salvador', 'Bahia', 'BR', '41150-000', 'Posto Shell / Entrada do São Gonçalo'),
(91, -12.957049369812012, -38.464782714843750, '2772-2810', 'R. Silveira Martins', 'Su00e3o Gonu00e7alo', 'Salvador', 'Bahia', 'BR', '41150-000', '19 BC'),
(92, -12.957400321960450, -38.464962005615234, '2855-2943', 'R. Silveira Martins', 'Su00e3o Gonu00e7alo', 'Salvador', 'Bahia', 'BR', '41150-000', '19 BC'),
(93, -12.958162307739258, -38.467250823974610, '3125-3209', 'R. Silveira Martins', 'Cabula', 'Salvador', 'Bahia', 'BR', '41150-000', 'Embasa Cabula'),
(94, -12.959057807922363, -38.467540740966800, '3168-3242', 'R. Silveira Martins', 'Cabula', 'Salvador', 'Bahia', 'BR', '41150-000', 'Embasa Cabula'),
(95, -12.960706710815430, -38.467933654785156, '3399-3515', 'R. Silveira Martins', 'Cabula', 'Salvador', 'Bahia', 'BR', '41150-000', 'Entrada do Resgate / Colu00e9gio Favo'),
(96, -12.961587905883789, -38.471176147460940, '3820-3866', 'R. Silveira Martins', 'Cabula', 'Salvador', 'Bahia', 'BR', '41150-000', ''),
(97, -12.961908340454102, -38.471176147460940, '3911-3941', 'R. Silveira Martins', 'Cabula', 'Salvador', 'Bahia', 'BR', '41150-000', ''),
(98, -12.963636398315430, -38.472194671630860, '3992-4162', 'R. Silveira Martins', 'Cabula', 'Salvador', 'Bahia', 'BR', '41150-000', 'Oi / Cabula Tropical Center / Colu00e9gio Resgate'),
(99, -12.963506698608398, -38.471977233886720, '4035-4205', 'R. Silveira Martins', 'Cabula', 'Salvador', 'Bahia', 'BR', '41150-000', 'Oi / Cabula Tropical Center / Colu00e9gio Resgate'),
(100, -12.953606605529785, -38.441463470458984, '1946-2010', 'Av. Teu00f3dulo Albuquerque', 'Cabula VI', 'Salvador', 'Bahia', 'BR', '41181-380', 'Academia Ju Sam / Angelo de Vasconcelos'),
(101, -12.957302093505860, -38.429603576660156, '2562-2602', 'Av. Luiz Viana Filho', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '', ''),
(102, -12.956761360168457, -38.430355072021484, '2503-2557', 'Av. Luiz Viana Filho', 'Sussuarana', 'Salvador', 'Bahia', 'BR', '41745-010', ''),
(103, -12.953455924987793, -38.426757812500000, '2748-2794', 'Av. Luiz Viana Filho', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '', 'Bahia Cafe Hall'),
(104, -12.953070640563965, -38.427593231201170, '2659-2827', 'Av. Luiz Viana Filho', 'Sussuarana', 'Salvador', 'Bahia', 'BR', '41745-010', 'TRE'),
(105, -12.919306755065918, -38.410854339599610, '498', 'Av. Aliomar Baleeiro', 'Vila Dois de Julho', 'Salvador', 'Bahia', 'BR', '41345-040', 'Posto de Gasolina BR'),
(106, -12.919135093688965, -38.411247253417970, '2347-2363', 'Av. Aliomar Baleeiro', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41345-040', 'Farmacia Santana'),
(107, -12.919468879699707, -38.411102294921875, '2665-2667', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', 'Nova Vida'),
(108, -12.922179222106934, -38.409191131591800, '1986-2488', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', 'Cond. Vila Rita'),
(109, -12.922525405883789, -38.409168243408200, '1987-2489', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', 'Cond. Vila Rita'),
(110, -12.922839164733887, -38.408832550048830, '1986-2488', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', ''),
(173, -13.002829551696777, -38.532283782958984, '3673', 'Av. Sete de Setembro', 'Barra', 'Salvador', 'Bahia', 'BR', '40130-000', 'Largo do Porto da Barra'),
(113, -12.926950454711914, -38.408630371093750, '1475-1985', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', 'Zoonoses'),
(114, -12.927670478820800, -38.408134460449220, '2-102', 'R. Heide Carneiro', 'Vila Dois de Julho', 'Salvador', 'Bahia', 'BR', '41262-100', 'Campo'),
(115, -12.927789688110352, -38.408370971679690, '1343-1473', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', ''),
(116, -12.928956031799316, -38.408412933349610, '1185-1341', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', ''),
(117, -12.930324554443360, -38.408271789550780, '1113-1183', 'R. Mocambo', 'Canabrava', 'Salvador', 'Bahia', 'BR', '41745-037', 'Cond. Asa'),
(118, -12.930870056152344, -38.408344268798830, '2-46', 'Estr. da Ilha do Mocambo', 'Trobogy', 'Salvador', 'Bahia', 'BR', '41745-050', ''),
(119, -12.933107376098633, -38.405311584472656, '656-814', 'R. Aymoru00e9 Moreira', 'Trobogy', 'Salvador', 'Bahia', 'BR', '41745-028', ''),
(120, -12.932999610900879, -38.405303955078125, '2-1078', 'R. Mocambo', 'Trobogy', 'Salvador', 'Bahia', 'BR', '41745-037', ''),
(121, -12.933542251586914, -38.404079437255860, '520-542', 'R. Aymoru00e9 Moreira', 'Trobogy', 'Salvador', 'Bahia', 'BR', '41745-028', ''),
(122, -12.933601379394531, -38.404342651367190, '544-654', 'R. Aymoru00e9 Moreira', 'Trobogy', 'Salvador', 'Bahia', 'BR', '41745-028', ''),
(123, -12.936975479125977, -38.403430938720700, '4015-4031', 'Av. Luu00eds Viana Filho Pista Lateral', 'Trobogy', 'Salvador', 'Bahia', 'BR', '', 'Posto Shell'),
(124, -12.937397003173828, -38.406311035156250, '3913-4013', 'Av. Luu00eds Viana Filho Pista Lateral', 'Trobogy', 'Salvador', 'Bahia', 'BR', '', ''),
(125, -12.937659263610840, -38.407951354980470, '3743-3911', 'Av. Luu00eds Viana Filho Pista Lateral', 'Trobogy', 'Salvador', 'Bahia', 'BR', '', ''),
(126, -12.938229560852050, -38.410987854003906, '3585-3725', 'Av. Luiz Viana Filho', 'Trobogy', 'Salvador', 'Bahia', 'BR', '41745-010', 'Faculdade Jorge Amado'),
(127, -12.939583778381348, -38.412014007568360, '3556-3672', 'Av. Luu00eds Viana Filho Pista Lateral', 'Patamares', 'Salvador', 'Bahia', 'BR', '', 'Faculdade Jorge Amado'),
(128, -12.938837051391602, -38.414073944091800, '3553-3567', 'Av. Luiz Viana Filho', 'Trobogy', 'Salvador', 'Bahia', 'BR', '41745-010', 'Colegio Dom Bosco'),
(129, -12.944297790527344, -38.421112060546875, '3167-3191', 'Av. Luiz Viana Filho', 'Sussuarana', 'Salvador', 'Bahia', 'BR', '41745-010', 'Pituacu-cab'),
(130, -12.947641372680664, -38.423610687255860, '2883-3165', 'Av. Luiz Viana Filho', 'Sussuarana', 'Salvador', 'Bahia', 'BR', '41745-010', ''),
(131, -12.943704605102539, -38.419479370117190, '3212-3280', 'Av. Luiz Viana Filho', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '', 'Estu00e1dio de Pituau00e7u'),
(132, -12.984453201293945, -38.507762908935550, '2-182', 'Prau00e7a Mu00e1rio Brasil', 'Nazaru00e9', 'Salvador', 'Bahia', 'BR', '40050-117', ''),
(133, -12.986303329467773, -38.508922576904300, '796-1264', 'Av. Pres. Costa E Silva', 'Engenho Velho de Bro', 'Salvador', 'Bahia', 'BR', '40050-115', ''),
(134, -12.988637924194336, -38.510749816894530, '1338-1428', 'Av. Pres. Costa E Silva', 'Garcia', 'Salvador', 'Bahia', 'BR', '40050-115', 'Entrada da Lapa'),
(135, -12.986225128173828, -38.510711669921875, '180-340', 'Av. Vale do Tororu00f3', 'Nazaru00e9', 'Salvador', 'Bahia', 'BR', '40050-290', ''),
(136, -12.983278274536133, -38.511058807373050, '', 'Acesso para Terminal de u00d4nibus', 'Nazaru00e9', 'Salvador', 'Bahia', 'BR', '', 'Estau00e7u00e3o da Lapa'),
(137, -12.986528396606445, -38.511093139648440, '163-291', 'Av. Vale do Tororu00f3', 'Nazaru00e9', 'Salvador', 'Bahia', 'BR', '40050-290', 'Sau00edda da Lapa'),
(138, -12.990073204040527, -38.511325836181640, '2574-2662', 'Av. Centenu00e1rio', 'Garcia', 'Salvador', 'Bahia', 'BR', '40100-180', 'IML'),
(139, -12.985487937927246, -38.504840850830080, '3894-3962', 'Av. Vasco da Gama', 'Engenho Velho de Bro', 'Salvador', 'Bahia', 'BR', '', 'Habbibs / Usina Geradora do Dique'),
(140, -12.984188079833984, -38.503780364990234, '4092-4118', 'Av. Vasco da Gama', 'Engenho Velho de Bro', 'Salvador', 'Bahia', 'BR', '', ''),
(141, -12.982398986816406, -38.503673553466800, '4274-4362', 'Av. Vasco da Gama', 'Engenho Velho de Bro', 'Salvador', 'Bahia', 'BR', '', 'Posto BR Dique'),
(142, -12.980489730834961, -38.456817626953125, '', 'Acesso para R Prof. Mu00edlton Caires de Brito', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '', 'A Tarde / Passarela Shopping Salvador'),
(143, -12.982529640197754, -38.454559326171875, '1192-1282', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Shopping Sumaru00e9 / Posto Shell'),
(144, -12.983051300048828, -38.450717926025390, '1548-1646', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Tok Stok / Petrobru00e1s / Bahia Gu00e1s'),
(145, -12.979027748107910, -38.451251983642580, '2098-2204', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41820-020', 'Hospital Sarah / Passarela Salvador Shopping'),
(146, -12.978936195373535, -38.451808929443360, '2181-2343', 'Av. Tancredo Neves', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '', 'Hospital Sarah / Passarela Salvador Shopping'),
(147, -12.950401306152344, -38.477653503417970, '43-51', 'Av. Gen. San Martin', 'Su00e3o Gonu00e7alo', 'Salvador', 'Bahia', 'BR', '40323-245', ''),
(148, -12.948034286499023, -38.479080200195310, '99-111', 'Av. Gen. San Martin', 'Pero Vaz', 'Salvador', 'Bahia', 'BR', '40342-030', 'Col. Luiz Eduardo'),
(149, -12.943374633789062, -38.483905792236330, '301-329', 'Av. Gen. San Martin', 'Pero Vaz', 'Salvador', 'Bahia', 'BR', '40366-100', 'Irmu00e3os Queiroz'),
(150, -12.939872741699219, -38.489452362060550, '507-547', 'Av. Gen. San Martin', 'Liberdade', 'Salvador', 'Bahia', 'BR', '40349-025', ''),
(151, -12.939319610595703, -38.493923187255860, '465-573', 'R. Luiz Maria', 'Uruguai', 'Salvador', 'Bahia', 'BR', '40411-540', 'Feira do Rolo'),
(152, -12.939352035522461, -38.493728637695310, '482-626', 'R. Luiz Maria', 'Liberdade', 'Salvador', 'Bahia', 'BR', '40411-540', ''),
(153, -12.933712005615234, -38.490242004394530, '502-630', 'Av. Afru00e2nio Peixoto', 'Lobato', 'Salvador', 'Bahia', 'BR', '40484-605', 'Av. Suburbana'),
(154, -12.931226730346680, -38.488319396972656, '1034-1102', 'Av. Afru00e2nio Peixoto', 'Lobato', 'Salvador', 'Bahia', 'BR', '40484-605', ''),
(155, -12.926023483276367, -38.485160827636720, '1600-1962', 'Av. Afru00e2nio Peixoto', 'Lobato', 'Salvador', 'Bahia', 'BR', '40484-605', ''),
(156, -12.922416687011719, -38.481750488281250, '90-140', 'Travessa Nova Estau00e7u00e3o', 'Lobato', 'Salvador', 'Bahia', 'BR', '', ''),
(157, -12.922686576843262, -38.481735229492190, '2196-2440', 'Av. Afru00e2nio Peixoto', 'Lobato', 'Salvador', 'Bahia', 'BR', '40484-605', ''),
(158, -12.916367530822754, -38.480762481689450, '2773-3085', 'Av. Afru00e2nio Peixoto', 'Lobato', 'Salvador', 'Bahia', 'BR', '40484-605', 'Lobato'),
(159, -12.915772438049316, -38.480533599853516, '2982-3478', 'Av. Afru00e2nio Peixoto', 'Lobato', 'Salvador', 'Bahia', 'BR', '40484-605', 'Lobato'),
(160, -12.909733772277832, -38.478931427001950, '3433-3729', 'Av. Afru00e2nio Peixoto', 'Lobato', 'Salvador', 'Bahia', 'BR', '40484-605', ''),
(161, -12.903883934020996, -38.476970672607420, '4626-4628', 'Av. Afru00e2nio Peixoto', 'Su00e3o Jou00e3o do ', 'Salvador', 'Bahia', 'BR', '40484-605', ''),
(162, -12.900140762329102, -38.475910186767580, '', 'Acesso para Av Afru00e2nio Peixoto', 'Su00e3o Jou00e3o do ', 'Salvador', 'Bahia', 'BR', '', '14u00aa CPM'),
(163, -12.898001670837402, -38.477184295654300, '3988-4162', 'Av. Afru00e2nio Peixoto', 'Plataforma', 'Salvador', 'Bahia', 'BR', '40484-605', 'Posto Zero Horas'),
(164, -12.893880844116211, -38.483318328857420, '', 'Acesso para R David Ferreira', 'Itacaranha', 'Salvador', 'Bahia', 'BR', '', 'Bompreu00e7o'),
(165, -12.894482612609863, -38.483291625976560, '5649-5709', 'Av. Afru00e2nio Peixoto', 'Plataforma', 'Salvador', 'Bahia', 'BR', '40484-605', ''),
(166, -12.891039848327637, -38.480709075927734, '510-572', 'R. David Ferreira', 'Ilha Amarela', 'Salvador', 'Bahia', 'BR', '41210-050', ''),
(167, -12.890138626098633, -38.478687286376950, '186-258', 'R. Esmeralda', 'Ilha Amarela', 'Salvador', 'Bahia', 'BR', '', 'Conj. Senhor do Bonfim'),
(168, -12.892233848571777, -38.476375579833984, '307-375', 'R. Agripino Nazareth', 'Itacaranha', 'Salvador', 'Bahia', 'BR', '40710-598', ''),
(169, -12.892221450805664, -38.476520538330080, '308-376', 'R. Agripino Nazareth', 'Itacaranha', 'Salvador', 'Bahia', 'BR', '40710-598', ''),
(170, -12.889444351196289, -38.478023529052734, '337-371', 'R. Esmeralda', 'Ilha Amarela', 'Salvador', 'Bahia', 'BR', '', ''),
(171, -12.889982223510742, -38.477806091308594, '733-791', 'R. u00c1gdo Ciru00edaco Eleutu00e9rio', 'Ilha Amarela', 'Salvador', 'Bahia', 'BR', '40718-200', ''),
(172, -13.006942749023438, -38.492511749267580, '54-146', 'Av. Vasco da Gama', 'Engenho Velho de Bro', 'Salvador', 'Bahia', 'BR', '40240-090', ''),
(174, -13.003211975097656, -38.532711029052734, '3708-3812', 'Av. Sete de Setembro', '', 'Salvador', 'Bahia', 'BR', '40130-001', ''),
(175, -13.007220268249512, -38.532821655273440, '3900-4372', 'Av. Sete de Setembro', '', 'Salvador', 'Bahia', 'BR', '40130-001', ''),
(176, -13.006407737731934, -38.533092498779300, '3900-4372', 'Av. Sete de Setembro', '', 'Salvador', 'Bahia', 'BR', '40130-001', ''),
(177, -13.009358406066895, -38.531967163085940, '4201-4263', 'Largo do Farol da Barra', 'Barra', 'Salvador', 'Bahia', 'BR', '40140-650', 'Farol da Barra'),
(178, -13.009531974792480, -38.532306671142580, '4202-4400', 'Largo do Farol da Barra', '', 'Salvador', 'Bahia', 'BR', '40140-650', 'Farol da Barra'),
(179, -13.009428024291992, -38.527427673339844, '417-559', 'Av. Oceu00e2nica', 'Barra', 'Salvador', 'Bahia', 'BR', '40140-130', 'Barra Center / Barra Flat'),
(180, -13.009633064270020, -38.524761199951170, '', 'Av. Oceu00e2nica', 'Barra', 'Salvador', 'Bahia', 'BR', '40140-130', 'Cristo'),
(181, -13.007953643798828, -38.518718719482420, '2-108', 'R. do Cristo', 'Barra', 'Salvador', 'Bahia', 'BR', '40140-820', 'Aeronautica'),
(182, -13.008140563964844, -38.515972137451170, '1807-1921', 'Av. Oceu00e2nica', 'Barra', 'Salvador', 'Bahia', 'BR', '40140-130', ''),
(183, -13.008906364440918, -38.515426635742190, '', 'Av. Oceu00e2nica', 'Barra', 'Salvador', 'Bahia', 'BR', '40140-130', ''),
(184, -13.009751319885254, -38.512947082519530, '2082-2226', 'Av. Pres. Vargas', 'Ondina', 'Salvador', 'Bahia', 'BR', '', ''),
(185, -13.010245323181152, -38.511466979980470, '', 'Av. Oceu00e2nica', 'Barra', 'Salvador', 'Bahia', 'BR', '40140-130', 'Ondina Apart Hotel'),
(186, -13.010371208190918, -38.509922027587890, '2583-2699', 'Av. Oceu00e2nica', 'Ondina', 'Salvador', 'Bahia', 'BR', '40140-130', 'Ondina Apart Hotel'),
(187, -13.010746955871582, -38.508972167968750, '', 'Av. Oceu00e2nica', 'Barra', 'Salvador', 'Bahia', 'BR', '41950-000', 'Saida da Ademar de Barros / Gordinhas'),
(188, -13.011346817016602, -38.506740570068360, '2-3094', 'Av. Oceu00e2nica', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-000', ''),
(189, -13.011119842529297, -38.506858825683594, '2875-2905', 'Av. Oceu00e2nica', 'Barra', 'Salvador', 'Bahia', 'BR', '41950-000', ''),
(190, -13.010873794555664, -38.501293182373050, '3501-3579', 'Av. Oceu00e2nica', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-000', 'Sukiyaki'),
(191, -13.010561943054200, -38.499256134033200, '3730-3806', 'Av. Oceu00e2nica', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-000', 'INSBOT'),
(192, -13.010377883911133, -38.498931884765625, '3807-4015', 'Av. Oceu00e2nica', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-000', 'INSBOT'),
(193, -13.011200904846191, -38.493637084960940, '129-399', 'R. da Paciu00eancia', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-010', ''),
(194, -13.012991905212402, -38.491214752197266, '1-239', 'R. Guedes Cabral', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-620', 'Igreja Matriz de Santana'),
(195, -13.014178276062012, -38.488491058349610, '2-54', 'R. Borges dos Reis', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-600', 'Mercado do Peixe / Largo da Mariquita'),
(196, -13.013346672058105, -38.485717773437500, '260-298', 'R. Dr. Odilon Santos', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41940-350', 'Hotel Pestana da Bahia / Hotel Mercure / Ibis'),
(197, -13.012958526611328, -38.482475280761720, '177-399', 'R. Marquu00eas de Monte Santo', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41940-330', 'McDonald''s / Bom Preu00e7o'),
(198, -13.014144897460938, -38.477897644042970, '137-169', 'Av. Amaralina', 'Amaralina', 'Salvador', 'Bahia', 'BR', '41900-020', 'Quartel de Amaralina'),
(199, -13.013669967651367, -38.472114562988280, '55-65', 'Av. Amaralina', 'Amaralina', 'Salvador', 'Bahia', 'BR', '41900-020', ''),
(200, -13.012048721313477, -38.467826843261720, '100', 'Av. Otu00e1vio Mangabeira', 'Nordeste', 'Salvador', 'Bahia', 'BR', '41830-050', 'Largo das Baianas'),
(201, -13.010399818420410, -38.465026855468750, '420-496', 'Av. Otu00e1vio Mangabeira', 'Nordeste', 'Salvador', 'Bahia', 'BR', '41830-050', 'Hotel Verdemar / Perini'),
(202, -13.008608818054200, -38.461311340332030, '814-928', 'Av. Otu00e1vio Mangabeira', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-050', 'Ki-Mukeka'),
(203, -13.008610725402832, -38.461303710937500, '814-928', 'Av. Otu00e1vio Mangabeira', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-050', ''),
(204, -13.006401062011719, -38.458641052246094, '1186-1268', 'Av. Otu00e1vio Mangabeira', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-050', ''),
(205, -13.005687713623047, -38.455440521240234, '1544-1624', 'Av. Otu00e1vio Mangabeira', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-050', ''),
(206, -13.000863075256348, -38.449546813964844, '2148-2444', 'Av. Otu00e1vio Mangabeira', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41830-050', ''),
(207, -12.997703552246094, -38.443725585937500, '', 'Av. Otu00e1vio Mangabeira', 'Costa Azul', 'Salvador', 'Bahia', 'BR', '41760-100', ''),
(208, -12.997673988342285, -38.444965362548830, '3063-3161', 'Av. Otu00e1vio Mangabeira', 'Costa Azul', 'Salvador', 'Bahia', 'BR', '41760-100', ''),
(209, -12.994338035583496, -38.440673828125000, '', 'Av. Otu00e1vio Mangabeira', 'Costa Azul', 'Salvador', 'Bahia', 'BR', '41760-100', ''),
(210, -12.992661476135254, -38.439620971679690, '3889-4129', 'Av. Otu00e1vio Mangabeira', 'Armau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '41750-240', ''),
(211, -12.991952896118164, -38.438686370849610, '', 'Av. Otu00e1vio Mangabeira', 'Armau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '41750-240', 'Ki-Mukeka'),
(212, -12.988575935363770, -38.435764312744140, '', 'Av. Otu00e1vio Mangabeira', 'Armau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '41750-240', 'Bom Preço / Sol Plaza / Restaurante Yemanjá'),
(213, -12.987867355346680, -38.435455322265625, '4533-4761', 'Av. Otu00e1vio Mangabeira', 'Armau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '41750-240', 'Bom Preço / Sol Plaza / Restaurante Yemanjá'),
(214, -12.982926368713379, -38.433155059814450, '5260-5440', 'Av. Otu00e1vio Mangabeira', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41706-690', 'Aeroclube'),
(215, -12.982654571533203, -38.433238983154300, '4997-5439', 'Av. Otu00e1vio Mangabeira', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41706-690', 'Aeroclube'),
(216, -12.981051445007324, -38.431041717529300, '5442-5662', 'Av. Otu00e1vio Mangabeira', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41706-690', ''),
(217, -12.980864524841309, -38.431274414062500, '311-487', 'Av. Iemanju00e1', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41710-755', ''),
(218, -12.978838920593262, -38.425292968750000, '6060-6334', 'Av. Otu00e1vio Mangabeira', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41706-690', 'Sede de Praia Esporte Clube Bahia'),
(219, -12.978712081909180, -38.425739288330080, '6263-6321', 'Av. Otu00e1vio Mangabeira', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41706-690', 'Sede de Praia Esporte Clube Bahia'),
(220, -12.976132392883300, -38.421176910400390, '6480-6956', 'Av. Otu00e1vio Mangabeira', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41706-690', ''),
(221, -12.975937843322754, -38.421512603759766, '6809-6947', 'Av. Otu00e1vio Mangabeira', 'Boca do Rio', 'Salvador', 'Bahia', 'BR', '41706-690', ''),
(222, -12.974987983703613, -38.417346954345700, '', 'Av. Otu00e1vio Mangabeira', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-000', ''),
(223, -12.974190711975098, -38.417724609375000, '7253-7371', 'R. Carimbamba', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-010', ''),
(224, -12.973024368286133, -38.413883209228516, '', 'Av. Otu00e1vio Mangabeira', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-000', ''),
(225, -12.971997261047363, -38.414466857910156, '7701-7829', 'R. Carimbamba', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-010', ''),
(226, -12.970457077026367, -38.410049438476560, '', 'Av. Otu00e1vio Mangabeira', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-000', ''),
(227, -12.969169616699219, -38.409942626953125, '8069-8555', 'R. Carimbamba', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-010', ''),
(228, -12.967604637145996, -38.405948638916016, '5370-5414', 'Av. Otu00e1vio Mangabeira', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-000', ''),
(229, -12.966724395751953, -38.406352996826170, '5385-5459', 'R. Carimbamba', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-010', ''),
(230, -12.962787628173828, -38.400413513183594, '5800-5868', 'Av. Otu00e1vio Mangabeira', 'Patamares', 'Salvador', 'Bahia', 'BR', '41680-000', ''),
(231, -12.963541030883789, -38.402439117431640, '5721-5759', 'R. Carimbamba', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-010', ''),
(232, -12.960681915283203, -38.395935058593750, '6086-6346', 'Av. Otu00e1vio Mangabeira', 'Jaguaribe', 'Salvador', 'Bahia', 'BR', '41680-000', ''),
(233, -12.959951400756836, -38.396400451660156, '6165-6229', 'Av. Otu00e1vio Mangabeira', 'Jaguaribe', 'Salvador', 'Bahia', 'BR', '41680-000', ''),
(234, -12.959138870239258, -38.393070220947266, '6348-6448', 'Av. Otu00e1vio Mangabeira', 'Jaguaribe', 'Salvador', 'Bahia', 'BR', '41680-000', ''),
(235, -12.958220481872559, -38.393154144287110, '6445-6493', 'Av. Otu00e1vio Mangabeira', 'Jaguaribe', 'Salvador', 'Bahia', 'BR', '41680-000', ''),
(236, -12.955885887145996, -38.386890411376950, '6780-6920', 'Av. Otu00e1vio Mangabeira', 'Jaguaribe', 'Salvador', 'Bahia', 'BR', '41680-000', ''),
(237, -12.955940246582031, -38.387649536132810, '6791-6973', 'Av. Otu00e1vio Mangabeira', 'Jaguaribe', 'Salvador', 'Bahia', 'BR', '41680-000', ''),
(238, -12.954447746276855, -38.383064270019530, '7128-7236', 'Av. Otu00e1vio Mangabeira', 'Jaguaribe', 'Salvador', 'Bahia', 'BR', '41650-045', ''),
(239, -12.954061508178711, -38.382843017578125, '7069-7077', 'Av. Otu00e1vio Mangabeira', 'Piatu00e3', 'Salvador', 'Bahia', 'BR', '41650-045', ''),
(241, -12.953391075134277, -38.379272460937500, '7372-7512', 'Av. Otu00e1vio Mangabeira', 'Piatu00e3', 'Salvador', 'Bahia', 'BR', '41650-045', ''),
(242, -12.953162193298340, -38.379318237304690, '7371-7511', 'Av. Otu00e1vio Mangabeira', 'Piatu00e3', 'Salvador', 'Bahia', 'BR', '41650-045', ''),
(243, -12.951712608337402, -38.373554229736330, '7798-7818', 'Av. Otu00e1vio Mangabeira', 'Piatu00e3', 'Salvador', 'Bahia', 'BR', '41650-045', ''),
(244, -12.950557708740234, -38.368652343750000, '8056-8140', 'Av. Otu00e1vio Mangabeira', 'Itapuu00e3', 'Salvador', 'Bahia', 'BR', '41610-160', ''),
(245, -12.950191497802734, -38.365615844726560, '25-27', 'R. Eng. Aristu00eddes M da Silveira', 'Itapuu00e3', 'Salvador', 'Bahia', 'BR', '', ''),
(246, -12.949853897094727, -38.365013122558594, '30', 'R. Eng. Aristu00eddes M da Silveira', 'Itapuu00e3', 'Salvador', 'Bahia', 'BR', '', ''),
(247, -12.949990272521973, -38.362888336181640, '421-443', 'Ladeira do Abaetu00e9', 'Itapuu00e3', 'Salvador', 'Bahia', 'BR', '41610-730', ''),
(248, -12.952436447143555, -38.360527038574220, '214-326', 'R. Prof. Souza Brito', 'Itapuu00e3', 'Salvador', 'Bahia', 'BR', '41640-380', ''),
(249, -12.952337265014648, -38.360523223876950, '213-325', 'R. Prof. Souza Brito', 'Itapuu00e3', 'Salvador', 'Bahia', 'BR', '41640-380', ''),
(250, -12.953952789306640, -38.358051300048830, '595-647', 'R. Prof. Souza Brito', 'Itapuu00e3', 'Salvador', 'Bahia', 'BR', '41640-380', ''),
(251, -12.999245643615723, -38.449523925781250, '530-642', 'R. Fernando Menezes de Gu00f3es', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41810-700', 'Colu00e9gio Integral'),
(252, -12.997639656066895, -38.450138092041016, '94-692', 'Av. Prof. Magalhu00e3es Neto', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '', ''),
(253, -12.992186546325684, -38.449668884277344, '894-928', 'Av. Prof. Magalhu00e3es Neto', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41810-012', 'GBarbosa'),
(254, -12.987189292907715, -38.450695037841800, '1301-1501', 'Av. Prof. Magalhu00e3es Neto', 'Pituba', 'Salvador', 'Bahia', 'BR', '41810-011', ''),
(255, -12.987305641174316, -38.450080871582030, '1302-1510', 'Av. Prof. Magalhu00e3es Neto', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41810-012', 'ACBEU'),
(256, -12.989545822143555, -38.450088500976560, '', 'Av. Prof. Magalhu00e3es Neto', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '', ''),
(257, -12.992982864379883, -38.450462341308594, '737-891', 'Av. Prof. Magalhu00e3es Neto', 'Pituba', 'Salvador', 'Bahia', 'BR', '41810-011', ''),
(258, -12.997950553894043, -38.450283050537110, '127-253', 'Av. Prof. Magalhu00e3es Neto', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41810-011', ''),
(259, -13.002814292907715, -38.452136993408200, '1-133', 'R. Fernando Menezes de Gu00f3es', 'Caminho das u00c1rvo', 'Salvador', 'Bahia', 'BR', '41810-700', 'Habbib''s'),
(260, -13.004886627197266, -38.456661224365234, '1133-1251', 'R. Rio de Janeiro', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-401', 'Igreja Nossa Senhora da Luz'),
(261, -13.005486488342285, -38.459533691406250, '1833-1975', 'Av. Manoel Dias da Silva', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-000', 'HSBC / Igreja Universal do Reino de Deus'),
(262, -13.007079124450684, -38.462169647216800, '1471-1493', 'Av. Manoel Dias da Silva', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-000', 'Idort / Insinuante / Sandwich Hall / Laboratorio Leme'),
(263, -13.009319305419922, -38.465461730957030, '1121', 'Av. Manoel Dias da Silva', 'Pituba', 'Salvador', 'Bahia', 'BR', '41830-000', 'COT / Bradesco / Banco do Brasil / Bom Preu00e7o'),
(264, -13.010850906372070, -38.467586517333984, '811-873', 'Av. Manoel Dias da Silva', 'Nordeste', 'Salvador', 'Bahia', 'BR', '41830-000', 'COT Fisioterapia'),
(265, -13.012192726135254, -38.482597351074220, '761-827', 'R. Oswaldo Cruz', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41940-000', 'McDonald''s / Bom Preu00e7o / Faculdade Ruy Barbosa '),
(266, -13.012413024902344, -38.485328674316406, '299-517', 'R. Oswaldo Cruz', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41940-000', 'Yemanju00e1 Trade / Itau00fa / Banco do Brasil'),
(267, -13.012997627258300, -38.489250183105470, '567-617', 'R. Conselheiro Pedro Luiz', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-610', ''),
(268, -13.012623786926270, -38.490398406982420, '53-141', 'R. Jou00e3o Gomes', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-640', 'Su00e3o Jorge Botequim / Cheiro de Pizza'),
(269, -13.010983467102050, -38.493705749511720, '129-399', 'R. da Paciu00eancia', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-010', ''),
(270, -13.009774208068848, -38.496292114257810, '225-325', 'R. Euricles de Matos', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41950-250', ''),
(271, -13.007434844970703, -38.491470336914060, '2-132', 'R. Lucaia', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '41940-660', ''),
(272, -13.007421493530273, -38.494556427001950, '3401-3633', 'Av. Anita Garibaldi', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '', 'UCSal - Pu00f3s Graduu00e7u00e3o'),
(273, -13.008557319641113, -38.495719909667970, '2604-2670', 'Av. Anita Garibaldi', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '', ''),
(274, -13.007511138916016, -38.498508453369140, '2317-2979', 'Av. Anita Garibaldi', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '', ''),
(275, -13.008055686950684, -38.498565673828125, '2302-2354', 'Av. Anita Garibaldi', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '', ''),
(276, -13.006237983703613, -38.500877380371094, '1567-2161', 'Av. Anita Garibaldi', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40170-130', 'Hospital Jorge Valente'),
(277, -13.006708145141602, -38.501003265380860, '1998-2142', 'Av. Anita Garibaldi', 'Rio Vermelho', 'Salvador', 'Bahia', 'BR', '40170-130', 'Hospital Jorge Valente'),
(278, -13.005143165588379, -38.502788543701170, '1748-1966', 'Av. Anita Garibaldi', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(279, -13.003286361694336, -38.502708435058594, '1567-2161', 'Av. Anita Garibaldi', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(280, -13.002542495727539, -38.503631591796875, '1322-1630', 'Av. Anita Garibaldi', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(281, -13.001317024230957, -38.504581451416016, '1283-1565', 'Av. Anita Garibaldi', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(282, -13.001286506652832, -38.505325317382810, '1170-1222', 'Av. Adhemar de Barros', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-110', ''),
(283, -12.999212265014648, -38.505912780761720, '789-1009', 'Av. Anita Garibaldi', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(284, -12.998485565185547, -38.506549835205080, '812-962', 'Av. Anita Garibaldi', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(285, -12.994452476501465, -38.507320404052734, '', 'Prau00e7a Lord Cochrane', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40210-255', ''),
(286, -12.992173194885254, -38.506938934326170, '261-309', 'Av. Anita Garibaldi', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(287, -12.994434356689453, -38.507850646972656, '384-452', 'Av. Anita Garibaldi', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40170-130', ''),
(288, -13.009818077087402, -38.509029388427734, '66-92', 'Av. Adhemar de Barros', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-110', 'Gordinhas / Banco do Brasil'),
(289, -13.006266593933105, -38.509021759033200, '420-454', 'Av. Adhemar de Barros', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-110', 'Entrada Principal UFBa / Zoolu00f3gico'),
(290, -13.006007194519043, -38.509529113769530, '449-461', 'Av. Adhemar de Barros', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-110', 'Entrada Principal UFBa / Zoolu00f3gico'),
(291, -13.003116607666016, -38.507106781005860, '500-1042', 'Av. Adhemar de Barros', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-110', 'Instituto de Matemu00e1tica - UFBa'),
(292, -13.002368927001953, -38.506607055664060, '499-1041', 'Av. Adhemar de Barros', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-110', 'Instituto de Matemu00e1tica - UFBa'),
(293, -12.969028472900390, -38.437458038330080, '754-764', 'Av. Jorge Amado', 'Paralela', 'Salvador', 'Bahia', 'BR', '41720-040', ''),
(294, -12.968935966491700, -38.433818817138670, '668-704', 'Av. Jorge Amado', 'Paralela', 'Salvador', 'Bahia', 'BR', '41720-040', ''),
(295, -12.968854904174805, -38.429298400878906, '576-584', 'Av. Jorge Amado', 'Paralela', 'Salvador', 'Bahia', 'BR', '41720-040', ''),
(296, -12.968866348266602, -38.426269531250000, '502-520', 'Av. Jorge Amado', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-630', ''),
(297, -12.969710350036621, -38.422370910644530, '424-438', 'Av. Jorge Amado', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-630', ''),
(298, -12.969622611999512, -38.436016082763670, '147-727', 'R. das Araras', 'Imbuu00ed', 'Salvador', 'Bahia', 'BR', '41720-010', ''),
(299, -12.969586372375488, -38.434032440185550, '137-139', 'R. das Araras', 'Imbuu00ed', 'Salvador', 'Bahia', 'BR', '41720-010', ''),
(300, -12.969169616699219, -38.424461364746094, '137-151', 'Av. Jorge Amado', 'Pituau00e7u', 'Salvador', 'Bahia', 'BR', '41740-630', ''),
(301, -12.971002578735352, -38.435272216796875, '140-226', 'R. das Gaivotas', 'Imbuu00ed', 'Salvador', 'Bahia', 'BR', '41720-070', ''),
(302, -12.972327232360840, -38.434612274169920, '239-317', 'R. Jayme Sapolnik', 'Imbuu00ed', 'Salvador', 'Bahia', 'BR', '41710-045', ''),
(303, -12.993636131286621, -38.509124755859375, '2-456', 'Av. Reitor Miguel Calmon', 'Federau00e7u00e3o', 'Salvador', 'Bahia', 'BR', '40231-300', ''),
(305, -13.002393722534180, -38.506637573242190, '499-1041', 'Avenida Adhemar de Barros', 'Ondina', 'Salvador', 'Bahia', 'BR', '40170-110', 'ufba'),
(306, -12.954542160034180, -38.459358215332030, '1-131', 'Rua Pedreira', 'Narandiba', 'Salvador', 'Bahia', 'BR', '', 'u00b4~');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `senha` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=15 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`) VALUES
(1, 'admin', 'admin', 'admin');


CREATE TABLE IF NOT EXISTS favorito (
  id_usuario INT, 
  tipo CHAR, 
  id_entidade INT, 
  PRIMARY KEY (id_usuario, tipo, id_entidade)
);

CREATE TABLE IF NOT EXISTS ocorrencia (
  id_ocorrencia INT AUTO_INCREMENT,
  id_usuario INT, 
  tipo_entidade CHAR, 
  id_entidade INT,
  data TIMESTAMP,
  tipo CHAR,
  descricao VARCHAR(400),
  PRIMARY KEY (id_ocorrencia)
);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
