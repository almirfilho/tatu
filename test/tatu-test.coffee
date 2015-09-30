expect = require('chai').expect
tatu = require '../src/tatu'
u = require './utils'

describe 'tatu', ->

  describe 'simple properties', ->
    ###
    given an arbitrary html node marked with `data-tu`:

    <div>
      <h1 data-tu="prop1">value 1</h1>
      <p data-tu="prop2">value 2</p>
    </div>

    it should return an object with corresponding keys/values:

    {
      prop1: 'value 1',
      prop2: 'value 2'
    }
    ###

    it 'should return empty object', ->
      u.inject '<h1>Elvis is alive</h1>'
      expect tatu document.body
        .to.be.an 'object'
        .and.to.be.empty

    it 'should not return not specified property', ->
      u.inject '<h1 data-tu>Elvis is alive</h1>'
      expect tatu document.body
        .to.be.an 'object'
        .and.to.be.empty

    it 'should return property and value', ->
      u.inject '<h1 data-tu="title">Elvis is alive</h1>'
      expect tatu document.body
        .to.deep.equal title: 'Elvis is alive'

    it 'should return multiple properties and values', ->
      u.inject '''
        <h1 data-tu="artist">Elvis</h1>
        <p data-tu="genre">rock</p>
      '''
      expect tatu document.body
        .to.deep.equal artist: 'Elvis', genre: 'rock'

    it 'should not return not specified properties', ->
      u.inject '''
        <h1 data-tu>Elvis</h1>
        <p data-tu="genre">rock</p>
      '''
      expect tatu document.body
        .to.deep.equal genre: 'rock'
