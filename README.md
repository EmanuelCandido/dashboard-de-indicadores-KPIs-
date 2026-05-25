# 📊 Trabalho Avaliativo - Dashboard de KPIs com SQL e Power BI

## 📋 Resumo do Projeto
Este projeto foi desenvolvido como requisito para a 3ª avaliação da disciplina. O objetivo principal foi criar um dashboard de indicadores (KPIs) baseado em dados relacionais, utilizando consultas SQL analíticas para a extração de métricas e o **Power BI** para a visualização dinâmica dos dados.

O cenário escolhido para o sistema foi um **Sistema Acadêmico de Saúde**, cujo objetivo é gerenciar a criação, o nível de dificuldade e a aprovação de casos clínicos desenvolvidos por professores para diferentes turmas da área da saúde (Medicina, Enfermagem, Odontologia, etc.).

## 🛠️ Ferramentas Utilizadas
* **Banco de Dados Relacional:** PostgreSQL (utilizando constraints, chaves estrangeiras e funções de data como `DATE_TRUNC`).
* **Linguagens:** SQL (DDL para criação das tabelas e DML para manipulação e consultas analíticas).
* **Visualização de Dados (BI):** Power BI.

---

## 💾 1. Backend e Estrutura do Banco de Dados
A modelagem atende à exigência de tabelas relacionadas, sendo composta por 3 tabelas principais:
1. **`professores`**: Armazena os dados dos docentes responsáveis (id, nome, email).
2. **`turmas`**: Registra as turmas ativas e inativas vinculadas a um professor (id, nome, semestre, status).
3. **`casos_clinicos`**: Armazena os problemas de saúde cadastrados para estudo, contendo nível de dificuldade, data de criação, status de aprovação e vínculo com a turma.

---

## 📈 2. Indicadores (KPIs) e Consultas SQL
O script SQL contém consultas avançadas que atendem aos requisitos (uso de `WHERE`, `COUNT`, `AVG`, `GROUP BY` e `ORDER BY`). Estes dados alimentaram os **4 KPIs principais** apresentados no topo do dashboard:

1. **Total de Casos Clínicos (39):** Contagem absoluta de registros na base.
2. **Casos Clínicos Pendentes (11):** Uso de `WHERE` para filtrar casos aguardando revisão.
3. **Turmas Ativas (7):** Filtro de status para identificar turmas com semestre em andamento.
4. **Média de Casos por Turma (4,88):** Subconsulta utilizando `AVG` e `COUNT` para medir a média de exercícios aplicados por turma.

---

## 🖥️ 3. Visualização de Dados (Dashboard)
A interface visual foi construída para permitir uma fácil interpretação gerencial por parte da coordenação do curso. Foram desenvolvidos 4 tipos diferentes de gráficos, cumprindo os requisitos da atividade:

* **Gráfico de Barras Horizontais (Casos Clínicos por Turma):** Mostra o volume de casos aplicados em cada disciplina, evidenciando que "Medicina A" possui a maior quantidade de casos.
* **Gráfico de Colunas (Casos Clínicos por Dificuldade):** Distribuição dos casos criados segmentados por dificuldade (Alta, Média, Baixa), com predominância de casos de "Alta" dificuldade.
* **Gráfico de Linhas (Casos Clínicos por Mês):** Exibe a evolução temporal de criação de casos entre os meses de janeiro e maio, demonstrando um pico acentuado de cadastros em maio.
* **Gráfico de Pizza (Casos Clínicos por Status):** Proporção exata do fluxo de aprovação dos casos: Aprovado (46,15%), Pendente (28,21%) e em Revisão (25,64%).



---

## 👨‍🎓 Integrantes
* Emanuel Cândido da Silva Lima
* João Pedro Melo Xavier
