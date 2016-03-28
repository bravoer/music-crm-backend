(in-package :mu-cl-resources)

;;;; define the resource

(define-resource score ()
  :class (s-prefix "music:Score")
  :properties `((:title :string ,(s-prefix "nie:title"))
                (:description :string ,(s-prefix "nie:description"))
                (:composer :string ,(s-prefix "music:composer"))
                (:arranger :string ,(s-prefix "music:arranger"))
                (:duration :string ,(s-prefix "dcterms:extent"))
                (:genre :string ,(s-prefix "music:genre"))
                (:publisher :string ,(s-prefix "nco:publisher"))
                (:status :string ,(s-prefix "bravoer:status")))
  :resource-base (s-url "http://backstage.bravoer.be/api/scores/")
  :has-many `((part :via ,(s-prefix "nie:isLogicalPartOf")
			   :inverse t
			   :as "parts"))
  :on-path "scores")

(define-resource part()
  :class (s-prefix "music:Part")
  :properties `((:instrument :string ,(s-prefix "music:instrument"))
                (:instrument-part :string ,(s-prefix "music:instrumentPart"))
                (:key :string ,(s-prefix "music:key"))
                (:clef :string ,(s-prefix "music:clef"))
                (:file :string ,(s-prefix "nfo:fileUrl"))
		(:name :string ,(s-prefix "nie:title")))
  :resource-base (s-url "http://backstage.bravoer.be/api/parts/")
  :has-one `((score :via ,(s-prefix "nie:isLogicalPartOf")
                            :as "score"))
  :on-path "parts")
