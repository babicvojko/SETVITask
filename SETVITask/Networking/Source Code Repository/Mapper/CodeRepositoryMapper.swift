//
//  CodeRepositoryMapper.swift
//  SETVITask
//
//  Created by Babic Vojko on 12.3.24..
//

import Foundation

struct CodeRepositoryMapper {
    let codeRepository: NetworkCodeRepository
    
    func map() -> CodeRepository {
        CodeRepository(id: codeRepository.id,
                       name: codeRepository.name,
                       isPrivate: codeRepository.isPrivate,
                       description: codeRepository.description)
    }
}
