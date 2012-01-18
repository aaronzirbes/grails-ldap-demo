package edu.umn.idm.demo

import grails.plugins.springsecurity.Secured

class SecureController {

	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index = { }
}
