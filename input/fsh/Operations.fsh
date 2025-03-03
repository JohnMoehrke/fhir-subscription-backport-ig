RuleSet:       OperationCommon
* jurisdiction        = http://unstats.un.org/unsd/methods/m49/m49.htm#001
* status              = #active
* date                = "2020-11-30"
* publisher           = "HL7 International - FHIR Infrastructure Work Group"
* contact[0].telecom[0].system = #url
* contact[0].telecom[0].value  = "https://hl7.org/Special/committees/fiwg/index.cfm"
* affectsState        = false
* version             = "0.1.1"
* kind                = #operation
* extension[0].url          = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[0].valueInteger = 0
* extension[1].url          = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[1].valueCode    = #trial-use


Instance:      backport-subscription-events
InstanceOf:    OperationDefinition
Usage:         #definition
Title:         "Subscription Events Operation"
Description:   "This operation is used to return historical events in the backported R5-Style Subscriptions."
* id            = "backport-subscription-events"
* name          = "R5SubscriptionEvents"
* description   = "This operation is used to search for and return notifications that have been previously triggered by a topic-based Subscription in R4."
* insert OperationCommon
* system        = false
* type          = false
* instance      = true
* code          = #events
* resource[0]   = #Subscription

* parameter[+].name          = #eventsSinceNumber
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "1"
* parameter[=].documentation = "The starting event number, inclusive of this event (lower bound)."
* parameter[=].type          = #string

* parameter[+].name          = #eventsUntilNumber
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "1"
* parameter[=].documentation = "The ending event number, inclusive of this event (upper bound)."
* parameter[=].type          = #string

* parameter[+].name          = #content
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "1"
* parameter[=].documentation = "Requested content style of returned data. Codes from backport-content-value-set (e.g., empty, id-only, full-resource). This is a hint to the server what a client would prefer, and MAY be ignored."
* parameter[=].type          = #code

* parameter[+].name          = #return
* parameter[=].use           = #out
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].documentation = "The operation returns a valid notification bundle, with the first entry being a SubscriptionStatus resource. The bundle type is \"history\"."
* parameter[=].type          = #Bundle


Instance:      backport-subscription-status
InstanceOf:    OperationDefinition
Usage:         #definition
Title:         "Subscription Status Operation"
Description:   "This operation is used to return the current status information about one or more backported R5-Style Subscriptions in R4."
* id            = "backport-subscription-status"
* name          = "R5SubscriptionStatus"
* description   = "This operation is used to return the current status information about one or more topic-based Subscriptions in R4."
* insert OperationCommon
* system        = false
* type          = true
* instance      = true
* code          = #status
* resource[0]   = #Subscription

* parameter[+].name          = #id
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "*"
* parameter[=].documentation = "At the Instance level, this parameter is ignored.  At the Resource level, one or more parameters containing a FHIR id for a Subscription to get status information for. In the absence of any specified ids, the server returns the status for all Subscriptions available to the caller. Multiple values are joined via OR (e.g., \"id1\" OR \"id2\")."
* parameter[=].type          = #id

* parameter[+].name          = #status
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "*"
* parameter[=].documentation = "At the Instance level, this parameter is ignored. At the Resource level, a Subscription status to filter by (e.g., \"active\"). In the absence of any specified status values, the server does not filter contents based on the status. Multiple values are joined via OR (e.g., \"error\" OR \"off\")."
* parameter[=].type          = #code

* parameter[+].name          = #return
* parameter[=].use           = #out
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].documentation = "The operation returns a bundle containing one or more SubscriptionStatus resources, one per Subscription being queried. The Bundle type is \"searchset\"."
* parameter[=].type          = #Bundle


Instance:      backport-subscription-get-ws-binding-token
InstanceOf:    OperationDefinition
Usage:         #definition
Title:         "Get WS Binding Token for Subscription Operation"
Description:   "This operation is used to get a token for a websocket client to use in order to bind to one or more subscriptions."
* id            = "backport-subscription-get-ws-binding-token"
* name          = "R5SubscriptionGetWsBindingToken"
* description   = "This operation is used to get a token for a websocket client to use in order to bind to one or more subscriptions."
* insert OperationCommon
* system        = false
* type          = true
* instance      = true
* code          = #get-ws-binding-token
* resource[0]   = #Subscription

* parameter[+].name          = #id
* parameter[=].type          = #id
* parameter[=].use           = #in
* parameter[=].min           = 0
* parameter[=].max           = "*"
* parameter[=].documentation = "At the Instance level, this parameter is ignored. At the Resource level, one or more parameters containing a FHIR id for a Subscription to get a token for. In the absense of any specified ids, the server may either return a token for all Subscriptions available to the caller with a channel-type of websocket or fail the request."

* parameter[+].name          = #token
* parameter[=].type          = #string
* parameter[=].use           = #out
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].documentation = "An access token that a client may use to show authorization during a websocket connection."

* parameter[+].name          = #expiration
* parameter[=].type          = #dateTime
* parameter[=].use           = #out
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].documentation = "The date and time this token is valid until."

* parameter[+].name          = #subscription
* parameter[=].type          = #string
* parameter[=].use           = #out
* parameter[=].min           = 0
* parameter[=].max           = "*"
* parameter[=].documentation = "The subscriptions this token is valid for."

* parameter[+].name          = #websocket-url
* parameter[=].type          = #url
* parameter[=].use           = #out
* parameter[=].min           = 1
* parameter[=].max           = "1"
* parameter[=].documentation = "The URL the client should use to connect to Websockets."
