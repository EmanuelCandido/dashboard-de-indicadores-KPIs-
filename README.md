# 📊 Trabalho Avaliativo - Dashboard de KPIs com SQL e Power BI

## 📋 Resumo do Projeto
Este projeto foi desenvolvido como requisito para a 3ª avaliação da disciplina. O objetivo principal foi criar um dashboard de indicadores (KPIs) baseado em dados relacionais, utilizando consultas SQL analíticas para a extração de métricas e o **Power BI** para a visualização dinâmica dos dados.

O trabalho foi dividido no desenvolvimento do *backend* (modelagem e consultas SQL para um cenário acadêmico) e do *frontend* (dashboard interativo para um cenário de vendas).

## 🛠️ Ferramentas Utilizadas
* **Banco de Dados Relacional:** PostgreSQL (evidenciado pelo uso de tipos como `SERIAL` e funções analíticas de tempo como `DATE_TRUNC`).
* **Linguagens:** SQL (DDL para criação e DML para manipulação e extração).
* **Visualização de Dados (BI):** Power BI.

---

## 💾 1. Backend e Consultas SQL (Gestão de Casos Clínicos)
Foi desenvolvida e populada uma base de dados relacional simulando um sistema acadêmico de saúde para gerenciar a criação de casos clínicos por professores.

### Estrutura do Banco de Dados
A modelagem atende à exigência de no mínimo 2 tabelas relacionadas, sendo composta por 3 tabelas principais:
1. **`professores`**: Armazena os dados dos docentes responsáveis (id, nome, email).
2. **`turmas`**: Registra as turmas ativas e inativas vinculadas a um professor (id, nome, semestre, status).
3. **`casos_clinicos`**: Armazena os problemas de saúde cadastrados para estudo, contendo nível de dificuldade, datas e status de aprovação.

### 📈 Indicadores (KPIs) Desenvolvidos em SQL
O script SQL contém consultas avançadas que atendem integralmente aos requisitos (uso de `WHERE`, `COUNT`, `AVG`, `GROUP BY` e `ORDER BY`):
* **KPI 1 - Total de Casos Criados:** Contagem absoluta de registros na base.
* **KPI 2 - Casos Pendentes:** Uso de `WHERE` para filtrar casos aguardando revisão.
* **KPI 3 - Turmas Ativas:** Filtro de status para identificar turmas em andamento.
* **KPI 4 - Média de Casos por Turma:** Subconsulta utilizando `AVG` e `COUNT` para medir o engajamento médio das turmas.

### 📊 Preparação de Dados para Gráficos (Consultas Analíticas)
As consultas foram estruturadas para alimentar visualizações específicas:
* **Gráfico de Barras:** Total de casos por turma (utilizando `LEFT JOIN`).
* **Gráfico de Linha:** Evolução temporal de criação de casos por mês.
* **Gráfico de Barras Horizontal:** Distribuição de casos por nível de dificuldade.
* **Gráfico de Pizza:** Proporção de casos por status (Aprovado, Pendente, Revisão).

---

## 🖥️ 2. Visualização de Dados (Dashboard Power BI)
A interface visual foi construída no **Power BI**, simulando um cenário real de um e-commerce/varejo de eletrônicos, focando em usabilidade (UX/UI) e fácil interpretação gerencial.

### Gráficos e Componentes Visuais
* **Gráfico de Barras Horizontais:** Total de vendas acumuladas por vendedor, destacando as melhores performances (ex: Mariana Fonseca Lopes).
* **Gráfico de Colunas:** Impacto financeiro das vendas cruzado por Faixa Etária dos clientes (destaque para o público de 26-35 anos).
* **Matrizes e Tabelas Dinâmicas:** * Preferência de produtos (Notebook, Smart TV, Fones) segmentada por **Sexo**.
  * Relação de compras cruzada com características demográficas atípicas (como **Faixa de Altura**).
  * Ticket Médio/Valor Total por vendedor detalhado por categoria de produto.

## ✅ Conclusão e Requisitos Atendidos
O projeto cumpre com excelência todos os critérios de avaliação propostos:
1. **Estrutura:** Mais de 2 tabelas relacionadas criadas.
2. **SQL Avançado:** Presença de 8 consultas analíticas distintas com filtros, junções e agregações.
3. **Indicadores:** Criação de mais de 4 KPIs claros e definidos.
4. **Visualização:** Uso de mais de 3 tipos de gráficos diferentes no Power BI, com tabelas de apoio que permitem filtros dinâmicos e cruzamento de informações.
