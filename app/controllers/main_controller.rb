class MainController < ApplicationController

	require 'digest/sha1'

	before_action :allow_iframe_requests
	before_action :set_cache_headers
	before_action :authorize, :except => [ :login, :index, :howtologin ]

	def authorize
		if session[ :username ].nil? then
			raise ApplicationController::NotAuthorized
		else
			@username = session[ :username ]
		end
	end

	def howtologin
	end

	def set_cache_headers
		response.headers["Cache-Control"] = "no-cache, no-store"
		response.headers["Pragma"] = "no-cache"
		response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end

	def allow_iframe_requests
	  response.headers.delete('X-Frame-Options')
	end

	def deleteplan
		PlanCapability.where( plan: params[:plan] ).destroy_all
	end

	def form
		plan = params[:plan]
		subcategory_id = params[:subcategory_id]
		
		session[ :plan ] = plan
		session[ :subcategory_id ] = subcategory_id
		session[ :facilitator ] = params[ :ier ]
		session[ :customer_name ] = params[ :iee ]
		session[ :groupname ] = params[ :group ]

		@existingcap = PlanCapability.where( plan: plan, subcategory_id: subcategory_id, groupname: session[ :groupname ] ).first
		@capabilities = Capability.where( subcategory_id: subcategory_id ).all

		@refreshviz = false

		if @existingcap
			@newcap = @existingcap
		else
			@newcap = PlanCapability.new
			@newcap.plan = session[ :plan ]
			@newcap.subcategory_id = session[ :subcategory_id ]
			@newcap.facilitator = session[ :facilitator ]
			@newcap.customer_name = session[ :customer_name ]
			@newcap.groupname = session[ :groupname ]
			@newcap.tableauuserid = session[ :username ]
		end
	end

	def set
		@newcap = PlanCapability.find_by( id: params[:id] )
		if !@newcap then
			@newcap = PlanCapability.new
		end

		@newcap.plan = session[ :plan ]
		@newcap.subcategory_id = session[ :subcategory_id ]
		@newcap.facilitator = session[ :facilitator ]
		@newcap.customer_name = session[ :customer_name ]
		@newcap.groupname = session[ :groupname ]
		@newcap.tableauuserid = session[ :username ]

		@newcap.update( plancapability_params )
		@newcap.save
		@capabilities = Capability.where( subcategory_id: @newcap.subcategory_id ).all

		@refreshviz = true

		render :template => "main/form"
	end

	def index

	end

	def login
		@username = params[ :username ]

		dt = params[ :dt ]
		key = params[ :key ]

		sql = "Select CURRENT_TIMESTAMP as timestamp, phrase from logins"
		records_array = Login.connection.select_all( sql ).to_hash

		@now = records_array[0][ "timestamp" ]
		phrase = records_array[0][ "phrase" ]

		digest = Digest::SHA1.hexdigest @username + "_" + dt + "_" + phrase
		@success = ( key == digest )

		@parseddate = DateTime.strptime( dt, '%Y-%m-%dT%H:%M:%S.%f %Z' )
		@elapsedtime = (( @now - @parseddate )).to_i

		@success = @success && ( @elapsedtime < 10 )

		if @success then
			session[ :username ] = @username
		else
			session[ :username ] = nil
		end
	end

	private
		def plancapability_params
	      params.permit( :id, :recommendation, :nextstepdate, :nextstepdesc, :answer, :subcategory_id, :capability_id )
	    end
	end
