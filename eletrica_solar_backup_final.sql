-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 02-Dez-2018 às 13:24
-- Versão do servidor: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eletrica_solar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `telefone` int(11) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpf`, `telefone`, `endereco`) VALUES
(1, 'Joao Roberto', '350.410.451-34', 82925923, 'Qn02 Conjunto 12 - Casa 02 - Riacho Fundo 1'),
(2, 'Mateus Rodrigues', '340.489.441-34', 98069481, 'Qn02 Conjunto 12 - Casa 02 - Riacho Fundo 1'),
(3, 'William Barbosa', '05686966133', 82925923, 'Qn02 Conjunto 10 - Casa 12 - Taguatinga'),
(4, 'William de Almeida', '04125222177', 598854, 'Qn02 Conjunto 12 - Casa 02 - Riacho Fundo 1'),
(5, 'Hudson Santos', '354.623.566-12', 33992956, 'Qn02 Conjunto 10 - Casa 12 - Taguatinga'),
(6, 'Tubo 20mm', '041.252.221-77', 925623456, 'Qn02 Conjunto 12 - Casa 02 - Riacho Fundo 1'),
(7, 'Flávio Da Casto', '652.248.651-26', 569862356, 'Qn02 Conjunto 10 - Casa 12 - Taguatinga');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `situacao` varchar(45) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `cpf`, `endereco`, `telefone`, `login`, `senha`, `situacao`, `id_perfil`) VALUES
(1, 'Administrador', NULL, NULL, NULL, 'admin', '1234', 'ativo', 1),
(2, 'Lucas Eduardo', '04125222177', 'Qn02 Conjunto 12 - Casa 12 - Guara 1', 598854, 'lucaE', 'etb', 'ativo', 2),
(3, 'Roberto Carlos', '05686966133', 'Qn02 Conjunto 10 - Casa 12 - Taguatinga', 339965, 'robertC', '456', 'ativo', 3),
(4, 'Ricardo Vieira', '041.252.221-77', 'Qn02 Conjunto 12 - Casa 02 - Riacho Fundo 1', 123655, 'ri', '1', 'ativo', 3),
(8, 'Karla Peres', '655.565.656-56', 'Qn02 Conjunto 12 - Casa 02 - Riacho Fundo 1', 4545455, 'kaka', '1', 'inativo', 3),
(9, 'Mateus Rodrigues', '041.252.221-77', 'Qn02 Conjunto 12 - Casa 02 - Riacho Fundo 1', 82925923, 'mateus', '1', 'ativo', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_venda`
--

CREATE TABLE `item_venda` (
  `id` bigint(20) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `item_venda`
--

INSERT INTO `item_venda` (`id`, `id_venda`, `id_produto`, `quantidade`, `preco`) VALUES
(1, 1, 1, 1, 20),
(2, 1, 2, 1, 35),
(3, 2, 2, 1, 35),
(4, 2, 1, 1, 20),
(5, 3, 1, 1, 20),
(6, 3, 2, 1, 35),
(7, 4, 2, 1, 35),
(8, 4, 1, 1, 20),
(9, 5, 1, 1, 20),
(10, 5, 2, 1, 35),
(11, 7, 1, 1, 20),
(12, 7, 2, 1, 35),
(13, 8, 1, 1, 20),
(14, 8, 1, 1, 20),
(15, 8, 2, 1, 35),
(16, 9, 1, 1, 20),
(17, 9, 2, 1, 35),
(18, 10, 1, 1, 20),
(19, 10, 2, 1, 35),
(20, 11, 1, 1, 20),
(21, 11, 2, 1, 35),
(22, 12, 1, 1, 20),
(23, 12, 2, 1, 35),
(24, 12, 2, 1, 35),
(25, 12, 2, 1, 35),
(26, 12, 1, 1, 20),
(27, 12, 1, 1, 20),
(28, 12, 1, 1, 20),
(29, 12, 1, 1, 20),
(30, 12, 1, 1, 20),
(31, 13, 1, 1, 20),
(32, 13, 2, 1, 35),
(33, 14, 1, 1, 20),
(34, 14, 1, 1, 20),
(35, 14, 1, 200, 20),
(36, 15, 1, 200, 20),
(37, 16, 1, 200, 20),
(38, 16, 2, 800, 35),
(39, 17, 2, 20, 35),
(40, 17, 6, 1, 150),
(41, 18, 2, 430, 35),
(42, 19, 3, 1, 36),
(43, 19, 1, 1, 20),
(44, 20, 2, 1, 35),
(45, 20, 7, 1, 36),
(46, 21, 6, 1, 150),
(47, 21, 2, 50, 35),
(48, 22, 2, 1, 35),
(49, 22, 9, 1, 89.9),
(50, 22, 9, 1, 89.9),
(51, 23, 3, 1, 36),
(52, 24, 7, 1, 36),
(53, 25, 4, 1, 50),
(54, 25, 5, 1, 20),
(55, 26, 3, 900, 36),
(56, 27, 3, 1, 36),
(57, 27, 3, 1, 36),
(58, 27, 3, 1, 36),
(59, 27, 3, 1, 36),
(60, 27, 3, 1, 36),
(61, 27, 2, 1, 35),
(62, 27, 2, 1, 35),
(63, 27, 2, 776, 35),
(64, 27, 7, 1, 36),
(65, 27, 7, 1, 36),
(66, 28, 4, 1, 50),
(67, 28, 9, 1, 89.9);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `icone` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`id`, `titulo`, `link`, `icone`) VALUES
(1, 'Cliente', 'listar_cliente.jsp', NULL),
(2, 'Venda', 'listar_venda.jsp', NULL),
(3, 'Tipos de pagamento', 'listar_tipo_de_pagamento.jsp', NULL),
(4, 'Funcionario', 'listar_funcionario.jsp', NULL),
(5, 'Produto', 'listar_produto.jsp', NULL),
(6, 'Menu', 'listar_menu.jsp', NULL),
(7, 'Perfil', 'listar_perfil.jsp', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`id`, `nome`, `descricao`) VALUES
(1, 'Administrador', 'Tem total acesso ao sistema.'),
(2, 'Gerente', 'Controla dados importantes para o sistema.'),
(3, 'Atendente', 'Tem acesso sobre os clientes, porém acesso parcial sobre as vendas e tipos de pagamento.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil_menu`
--

CREATE TABLE `perfil_menu` (
  `id_perfil` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil_menu`
--

INSERT INTO `perfil_menu` (`id_perfil`, `id_menu`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) NOT NULL,
  `preco_un` double NOT NULL,
  `qtdEstoque` double NOT NULL,
  `link_imagem` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`id`, `nome`, `marca`, `descricao`, `preco_un`, `qtdEstoque`, `link_imagem`) VALUES
(1, 'Tubo 20mm', 'Tigre', 'COMPONENTE DE TUBULACAO', 20, 249, NULL),
(2, 'Torneira', 'Amanco', 'COMPONENTE DE TUBULACAO', 35, 778, NULL),
(3, 'Chave de fenda', 'Vonder', 'Chave para parafusar', 36, 848, NULL),
(4, 'Trena', 'Starret', 'Trena com Trava 05mx16', 50, 448, NULL),
(5, 'Lumbrificante', 'Starret', 'Para lubrificar ferrolhos e coisas emperradas', 20, 449, NULL),
(6, 'Parafusadeira', 'Bosch', 'Para parafusar', 150, 448, NULL),
(7, 'Chuveiro', 'Lorenzeti', 'Para banhos', 36, 448, NULL),
(8, 'Chave philips', 'Vonder', 'Chave para parafusar', 36, 450, NULL),
(9, 'Fio elÃ©trico', 'Megatron', 'Cabo FlexÃ?Â­vel 2,5mm 100Metros Azul 750V Megatron', 89.9, 997, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_de_pagamento`
--

CREATE TABLE `tipo_de_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `icone` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_de_pagamento`
--

INSERT INTO `tipo_de_pagamento` (`id`, `nome`, `descricao`, `icone`) VALUES
(2, 'Dinheiro', 'Pagamentos a vista.', 'dinheiro.png'),
(3, 'Cartao', 'Cartoes de todas as bandeiras', 'cartao.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE `venda` (
  `id` int(11) NOT NULL,
  `idtipo_de_pagamento` int(11) NOT NULL,
  `data_venda` datetime NOT NULL,
  `data_cancelamento` datetime DEFAULT NULL,
  `data_pagamento` datetime DEFAULT NULL,
  `id_funcionario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`id`, `idtipo_de_pagamento`, `data_venda`, `data_cancelamento`, `data_pagamento`, `id_funcionario`, `id_cliente`) VALUES
(1, 3, '2018-11-16 20:59:05', NULL, NULL, 1, 1),
(2, 2, '2018-11-16 21:19:06', NULL, NULL, 1, 1),
(3, 2, '2018-11-18 16:00:52', '2018-11-20 15:18:52', NULL, 1, 1),
(4, 2, '2018-11-19 17:48:28', NULL, NULL, 1, 1),
(5, 3, '2018-11-20 13:53:52', NULL, NULL, 1, 1),
(6, 3, '2018-11-08 00:00:00', '2018-11-25 23:19:15', NULL, 2, 1),
(7, 3, '2018-11-20 14:55:16', '2018-11-20 15:32:48', NULL, 1, 2),
(8, 2, '2018-11-20 14:56:33', '2018-11-20 15:52:56', NULL, 1, 3),
(9, 2, '2018-11-20 14:56:43', NULL, NULL, 1, 3),
(10, 2, '2018-11-20 14:56:53', NULL, NULL, 1, 2),
(11, 3, '2018-11-20 19:15:58', '2018-11-20 19:57:09', NULL, 1, 4),
(12, 2, '2018-11-20 19:56:53', NULL, NULL, 1, 4),
(13, 3, '2018-11-20 22:18:49', NULL, NULL, 1, 2),
(14, 3, '2018-11-22 20:39:38', '2018-11-22 20:40:10', NULL, 1, 1),
(15, 3, '2018-11-22 20:40:34', NULL, NULL, 1, 1),
(16, 2, '2018-11-26 23:29:05', '2018-11-26 23:30:01', NULL, 1, 3),
(17, 3, '2018-11-30 19:59:14', NULL, NULL, 1, 2),
(18, 3, '2018-11-30 19:59:52', '2018-11-30 20:00:12', NULL, 1, 2),
(19, 2, '2018-12-01 11:56:53', NULL, NULL, 1, 2),
(20, 2, '2018-12-01 12:00:11', NULL, NULL, 1, 2),
(21, 2, '2018-12-01 12:58:07', NULL, NULL, 1, 5),
(22, 2, '2018-12-01 13:03:23', NULL, NULL, 1, 2),
(23, 2, '2018-12-01 13:18:33', NULL, NULL, 1, 3),
(24, 2, '2018-12-01 13:19:44', NULL, NULL, 1, 5),
(25, 2, '2018-12-01 13:49:52', NULL, NULL, 1, 2),
(26, 2, '2018-12-01 14:32:37', '2018-12-01 14:33:09', NULL, 1, 1),
(27, 2, '2018-12-01 16:36:49', '2018-12-01 23:08:20', NULL, 4, 2),
(28, 3, '2018-12-01 21:42:11', NULL, NULL, 9, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_funcionario_perfil1_idx` (`id_perfil`);

--
-- Indexes for table `item_venda`
--
ALTER TABLE `item_venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venda_produto_produto1_idx` (`id_produto`),
  ADD KEY `fk_venda_produto_venda1_idx` (`id_venda`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD PRIMARY KEY (`id_perfil`,`id_menu`),
  ADD KEY `fk_perfil_has_menu_menu1_idx` (`id_menu`),
  ADD KEY `fk_perfil_has_menu_perfil1_idx` (`id_perfil`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_de_pagamento`
--
ALTER TABLE `tipo_de_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_venda_tipo_de_pagamento1_idx` (`idtipo_de_pagamento`),
  ADD KEY `fk_venda_funcionario1_idx` (`id_funcionario`),
  ADD KEY `fk_venda_cliente1_idx` (`id_cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `item_venda`
--
ALTER TABLE `item_venda`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tipo_de_pagamento`
--
ALTER TABLE `tipo_de_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `venda`
--
ALTER TABLE `venda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD CONSTRAINT `fk_funcionario_perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `item_venda`
--
ALTER TABLE `item_venda`
  ADD CONSTRAINT `fk_venda_produto_produto1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venda_produto_venda1` FOREIGN KEY (`id_venda`) REFERENCES `venda` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `perfil_menu`
--
ALTER TABLE `perfil_menu`
  ADD CONSTRAINT `fk_perfil_has_menu_menu1` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_perfil_has_menu_perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `perfil` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venda_funcionario1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venda_tipo_de_pagamento1` FOREIGN KEY (`idtipo_de_pagamento`) REFERENCES `tipo_de_pagamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
