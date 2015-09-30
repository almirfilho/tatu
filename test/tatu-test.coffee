expect = require('chai').expect
tatu = require '../src/tatu'
u = require './utils'

describe 'tatu', ->

  describe 'single element property', ->
    ###
    given an arbitrary html node marked with `data-tu`:

    <p data-tu="prop">value</p>

    it should return an string: 'value'
    ###

    it 'should return value', ->
      u.inject '<h1 data-tu="title">Elvis is alive</h1>'
      expect tatu u.one 'h1'
        .to.be.equal 'Elvis is alive'

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

  describe 'list properties', ->
    ###
    given an arbitrary html node marked with `data-tu`:

    <ul>
      <li data-tu="prop">value 1</li>
      <li data-tu="prop">value 2</li>
      <li data-tu="prop">value 3</li>
    </ul>

    it should return an object with list:

    {
      prop: ['value 1', 'value 2', 'value 3']
    }
    ###

    before -> u.inject '''
        <span data-tu="beatles">john</span>
        <span data-tu="beatles">paul</span>
        <span data-tu="beatles">george</span>
        <span data-tu="beatles">ringo</span>
      '''

    it 'should return a single prop', ->
      expect tatu document.body
        .to.have.keys 'beatles'

    it 'should return an array', ->
      expect tatu(document.body).beatles
        .to.be.instanceof Array
        .and.to.be.not.empty

    it 'should return array values', ->
      expect tatu(document.body).beatles
        .to.have.length 4
        .and.to.contain 'john'
        .and.to.contain 'paul'
        .and.to.contain 'george'
        .and.to.contain 'ringo'

  describe 'object properties', ->
    ###
    given an arbitrary html node marked with `data-tu`:

    <div>
      <div data-tu="obj">
        <span data-tu="prop1">value 1</span>
        <span data-tu="prop2">value 2</span>
      </div>
    </div>

    it should return an object like:

    {
      obj: {
        prop1: 'value 1',
        prop2: 'value 2'
      }
    }
    ###

    before ->
      u.inject '''
        <div data-tu="band">
          <span data-tu="name">pink floyd</span>
          <span data-tu="country">england</span>
        </div>
      '''

    it 'should return property as an object', ->
      expect tatu(document.body).band
        .to.be.an 'object'

    it 'should return nested properties', ->
      expect tatu(document.body).band
        .to.have.keys 'name', 'country'

    it 'should return nested values', ->
      expect tatu(document.body).band
        .to.deep.equal name: 'pink floyd', country: 'england'

    # it 'should not return nested properties outside of its object', ->
    #   expect tatu document.body
    #     .to.not.contain.keys 'name', 'country'

    # it 'should return nested values', ->
    #   expect tatu document.body
    #     .to.deep.equal band: name: 'pink floyd', country: 'england'
