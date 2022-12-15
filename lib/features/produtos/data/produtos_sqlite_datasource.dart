import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite_curso/core/data/data_general_constants.dart';
import 'package:sqlite_curso/features/produtos/data/data_produtos_constants.dart';
import 'package:sqlite_curso/features/produtos/domain/entities/produto_entity.dart';

//? CLASSE DE FONTE DE DADOS PARA TRABALHAR COM OS PRODUTOS DO APP

class ProdutosSqliteDatasource {
  //? METODO PARA FORNECER A BASE DE DADOS DO APP
  Future<Database> _getDatabase() async {
    //? SEMPRE QUE A BASE DE DADOS FOR BUSCADA, ELA SERÁ DELETADA
    // await deleteDatabase(
    //   join(await getDatabasesPath(), kDATABASE_NAME),
    // );

    return openDatabase(
      //* unir o nome onde está armazenado fisicamente o arquivo como o nome da constante
      join(await getDatabasesPath(), kDATABASE_NAME),
      onCreate: (db, version) async {
        await db.execute(kCREATE_PRODUTOS_TABLE_SCRIPT);

        //? APOS CRIACAO DA TABELA, SERA INSERIDO UM REGISTRO COM DADOS DE TESTES

        //* rawInsert não faz uso mapeamento relacional
        //* ''' STRING ENTRE 3 ASPAS GARANTE A SEQUENCIA DE IMPLEMENTAÇÃO DOS VALORES
        await db.rawInsert(''' 
        inserts into $kPRODUTOS_TABLE_NAME(
          $kPRODUTOS_COLUMN_NOME, $kPRODUTOS_COLUMN_DESCRICAO,
          $kPRODUTOS_COLUMN_VALOR)
          VALUES(
          'Suco de Laranja', '300 ml - Natural', 5
          ''');
      },

      version: kDATABASE_VERSION,
    );
  }

  //? METODO DE CRIAÇÃO DO REGISTRO - PRIMEIRO METODO CRUD
  //* recebe os dados como argumento do ProdutoEntity
  Future create(ProdutoEntity produto) async {
    try {
      //* PRIMEIRO PASSO É OBTER A BASE DE DADOS
      final Database db = await _getDatabase();

      produto.produtoID =
          await db.rawInsert('''insert into $kPRODUTOS_TABLE_NAME(
        $kPRODUTOS_COLUMN_NOME, $kPRODUTOS_COLUMN_DESCRICAO,
        $kPRODUTOS_COLUMN_VALOR)
        VALUES(
          //? INSERINDO OS VALOR DE ACORDO COM OS ARGUMENTOS RECEBIDOS
          '${produto.nome}',
          '${produto.descricao}',
          '${produto.valor}'
        )
       ''');
    } catch (ex) {
      return;
    }
  }
}
