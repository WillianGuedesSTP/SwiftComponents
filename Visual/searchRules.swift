        
//  SearchTools.swift
//  Created by Willian Guedes da Silva Cunha on 25/04/18.
//  Version: 0.1.1

import Foundation

class SearchTools{
    
    /** Function - searchBasic
     *  Função cujo o proposito é filtrar uma array de acordo com o parametro do textfield, afim de tornar mais customizavel os campos de busca
     *  @param  : element(String) - elemento que devera ser comparado, sender(String) - texto do textfield
     *  @return : Bool, validando se aquele campo é correspondente ou não
     *
     *  #Resumo
     *  Está função deve ser executada dentro do filter de uma lista, onde deverá ser enviado o item da lista(element) e o texto digitado.
     */
     func searchRules(_ element: String, _ sender: String) -> Bool{
          var isCorrect: Bool
          isCorrect = element.lowercased().replacingOccurrences(of: " ", with: "").contains(sender.lowercased().replacingOccurrences(of: " ", with: ""))
          return isCorrect
     }
}
