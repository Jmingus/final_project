class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, :styles => { :large => "300x300>",
                                          :medium => "200x200>",
                                          :small => "100x100>",
                                          :thumb => "50x50>" },
                    :default_url => "/images/:style/missing.png",
                    :url =>':s3_domain_url',
                    :path => '/:class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_many :animes
  has_many :mangas
end
