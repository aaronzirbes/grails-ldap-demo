package edu.umn.idm.demo

class MenuController {

	def springSecurityService

    def index = {
		def auth = springSecurityService.authentication

		def token = auth.class.toString()
		def username = ''
		def authorities = ''
		def authenticated = ''

		if (auth.class.toString().contains('AnonymousAuthenticationToken') ) {
			username = 'ANONYMOUS'
		} else {
			def principal = auth.principal
			username = principal.username
			authorities = principal["authorities"]
			authenticated = auth.authenticated
		}

		[ token: token,
		authentication: auth,
		principal: principal,
		username: username,
		authorities: authorities,
		authenticated: authenticated ]
	}
}
