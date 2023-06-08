# Testes Hourglass

### Ambiente necessário para execução

- [Git](https://git-scm.com)
- [Node.js](https://nodejs.org/en/)
- [VSCode](https://code.visualstudio.com/)
- [JDK](https://www.oracle.com/java/technologies/downloads/)
- [Maven](https://maven.apache.org/)

### Como executar:

- Clone este repositório
```
https://github.com/mairaalvs/testesHourglass.git
```

- Abra o terminal na pasta do projeto e execute a partir do Runner ou suíte:
mvn test –Dtest=hourglassRunner

- Execute testes separados por tags:
mvn test -Dkarate.options="--tags @tag”

- Ignore alguma tag:
mvn test -Dkarate.options="--tags ~@tag" 

Todas as tags podem ser configuradas na classe da suíte de testes.

### Como gerar o relatório de testes:

Após a execução basta entrar no link gerado no terminal que o relatório será aberto no navegador.

<p align="center"> <img src="/teste_hourglass/assets/relatorio_testes.PNG" alt="Relatorio de Testes" /> </p>