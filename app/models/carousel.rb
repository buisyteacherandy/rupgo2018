class Carousel < ApplicationRecord
	translates :body, :carouselpic, :carouselpic1, :carouselpic2, :carouselpic3

	has_attached_file :carouselpic, styles: { medium: "1280x720", thumb: "800x600"}
    validates_attachment_content_type :carouselpic, content_type: /\Aimage\/.*\Z/

    has_attached_file :carouselpic1, styles: { medium: "1280x720", thumb: "800x600"}
    validates_attachment_content_type :carouselpic, content_type: /\Aimage\/.*\Z/

    has_attached_file :carouselpic2, styles: { medium: "1280x720", thumb: "800x600"}
    validates_attachment_content_type :carouselpic2, content_type: /\Aimage\/.*\Z/


    has_attached_file :carouselpic3, styles: { medium: "1280x720", thumb: "800x600"}
    validates_attachment_content_type :carouselpic3, content_type: /\Aimage\/.*\Z/
end
