<html>
    <head>
        <title>Grails Spring Security LDAP - Test Application</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }

		dt {
			font-family: monospace;
			font-weight: bold;
		}
		dd {
			font-family: monospace;
			font-weight: bold;
			margin-top: 0.5em;
			margin-left: 2em;
			clear:right;
			background-color: #bbd;
		}
        </style>
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Application Status</h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>Installed Plugins</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
			<h1>Grails Spring Security LDAP - Test Application</h1>

			<h2>Link to Secured Page</h2>
			<p><g:link controller="secure" action="index">Web Page Secured using Annotation</g:link></p>

			<h2>Authentication Information</h2>
			<hr/>
			<dl>
				<dt>token</dt>          <dd>${token}</dd>
				<dt>username</dt>       <dd>${username}</dd>
				<dt>authorities</dt>
				<dd>
					<ul>
					<g:each var="a" in="${authorities}">
						<li>${a}</li>
					</g:each>
					</ul>
				</dd>
				<dt>authenticated</dt>  <dd>${authenticated}</dd>
				<dt>authentication</dt> <dd>${authentication}</dd>
				<dt>principal</dt>      <dd>${principal}</dd>
			</dl>
			<hr/>


            <h2>Spring Security Filter Link</h2>

			<hr/>
			<p>Spring Security Filter <a href="${resource(file:'/')}j_spring_security_check">Spring Security Core</a>.</p>
			<p>Spring Security Filter <a href="${resource(file:'/')}j_spring_security_logout">Logout</a>.</p>
			<hr/>

			<h3>Request Attributes</h3>
			<dl>
			<g:each var="ran" in="${request.attributeNames}">
				<dt>${ran}</dt>
				<dd>${request[ran]}</dd>
			</g:each>
			</dl>

			<h3>Session Attributes</h3>
			<dl>
			<g:each var="san" in="${session.attributeNames}">
				<dt>${san}</dt>
				<dd>${session[san]}</dd>
			</g:each>
			</dl>

			<h3>Environment Variables</h3>
			<dl>
			<g:set var="env" value="${System.getenv()}" />
			<g:each var="envVar" in="${env}">
				<g:set var="v" value="${envVar.toString()}" />
				<dt>${v}</dt>
			</g:each>
			</dl>
        </div>

		<div id="footer">Thanks!</div>

        </div>
    </body>
</html>
