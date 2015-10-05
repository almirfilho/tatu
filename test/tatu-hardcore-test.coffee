expect = require('chai').expect
tatu = require '../src/tatu'
u = require './utils'

describe 'tatu() hardcore tests', ->

  it 'should return all data correctly (1)', ->
    u.inject '''
      <div data-tu="simple">simple value</div>
      <div data-tu="list">list value 1</div>
      <div data-tu="list">list value 2</div>
      <div data-tu="object">
        <div data-tu="prop">prop value</div>
      </div>
    '''
    expect tatu document.body
      .to.deep.equal
        simple: 'simple value'
        list: ['list value 1', 'list value 2']
        object: prop: 'prop value'

  it 'should return all data correctly (2)', ->
    u.inject '''
      <div data-tu="object1">
        <div data-tu="prop1">value 1</div>
        <div data-tu="object2">
          <div data-tu="prop2">value 2</div>
          <div data-tu="object3">
            <div data-tu="prop3">value 3</div>
            <div data-tu="object4">
              <div data-tu="prop4">value 4</div>
            </div>
          </div>
        </div>
      </div>
    '''
    expect tatu document.body
      .to.deep.equal
        object1:
          prop1: 'value 1'
          object2:
            prop2: 'value 2'
            object3:
              prop3: 'value 3'
              object4:
                prop4: 'value 4'

  it 'should return all data correctly (3)', ->
    u.inject '''
      <div data-tu="object1">
        <div data-tu="list1">list1 value 1</div>
        <div data-tu="list1">list1 value 2</div>
        <div data-tu="object2">
          <div data-tu="list2">list2 value 1</div>
          <div data-tu="list2">list2 value 2</div>
          <div data-tu="object3">
            <div data-tu="list3">list3 value 1</div>
            <div data-tu="list3">list3 value 2</div>
            <div data-tu="object4">
              <div data-tu="list4">list4 value 1</div>
              <div data-tu="list4">list4 value 2</div>
            </div>
          </div>
        </div>
      </div>
    '''
    expect tatu document.body
      .to.deep.equal
        object1:
          list1: ['list1 value 1', 'list1 value 2']
          object2:
            list2: ['list2 value 1', 'list2 value 2']
            object3:
              list3: ['list3 value 1', 'list3 value 2']
              object4:
                list4: ['list4 value 1', 'list4 value 2']

  it 'should return all data correctly (4)', ->
    u.inject '''
      <div data-tu="object">
        <div data-tu="list">list value 1</div>
        <div data-tu="list">list value 2</div>
        <div data-tu="list">
          <div data-tu="prop1">prop value 1</div>
          <div data-tu="prop2">prop value 2</div>
          <div data-tu="list2">list2 value 1</div>
          <div data-tu="list2">list2 value 2</div>
        </div>
      </div>
    '''
    expect tatu document.body
      .to.deep.equal
        object:
          list: [
            'list value 1'
            'list value 2'
            prop1: 'prop value 1'
            prop2: 'prop value 2'
            list2: ['list2 value 1', 'list2 value 2']
          ]
