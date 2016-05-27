class Photo < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image
	validates_attachment :image, content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :image_file_name, presence: true

	# validates_attachment :image, presence: true,
 #                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
 #                     size: { in: 0..500.kilobytes }
	has_attached_file :image,
                  styles: { thumb: ["200x200#", :jpg],
                            original: ['1500x1500', :jpg] },
                  convert_options: { thumb: "-quality 75 -strip",
                                     original: "-quality 85 -strip" }
  
  # has_attached_file :image,
  #                 styles: { thumb: ["64x64#", :jpg],
  #                           original: ['500x500>', :jpg] },
  #                 convert_options: { thumb: "-quality 75 -strip",
  #                                    original: "-quality 85 -strip" },
  #                 storage: :s3,
  #                 s3_credentials: {access_key_id: ENV["AKIAIANRJXY32MDRSZ5Q"], secret_access_key: ENV["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"]},
  #                 bucket: "codingdojo-photo-blog"
end
