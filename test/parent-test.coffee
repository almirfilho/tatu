expect = require('chai').expect
parent = require '../src/parent'
u = require './utils'

describe 'parent', ->

  it 'should return null when there is no parent', ->
    u.inject '''
      <div>
        <span>iron maiden</span>
      </div>
    '''
    expect parent u.one 'span'
      .to.not.exist

  it 'should return parent', ->
    u.inject '''
      <div id="black-sabbath" data-tu>
        <span>iron maiden</span>
      </div>
    '''
    expect parent u.one 'span'
      .to.exist
      .and.to.have.property 'id', 'black-sabbath'

  it 'should return parent', ->
    u.inject '''
      <div id="black-sabbath" data-tu>
        <div>
          <span>iron maiden</span>
        </div>
      </div>
    '''
    expect parent u.one 'span'
      .to.exist
      .and.to.have.property 'id', 'black-sabbath'