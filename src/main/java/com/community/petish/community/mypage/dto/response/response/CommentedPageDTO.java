<<<<<<< HEAD:src/main/java/com/community/petish/community/mypage/dto/response/response/CommentedPageDTO.java
package com.community.petish.mypage.dto.response;
=======
package com.community.petish.community.mypage.dto.response;
>>>>>>> fda4f2d15939573444b0292410cb1859f5983d84:src/main/java/com/community/petish/community/mypage/dto/response/CommentedPageDTO.java

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@Getter
@AllArgsConstructor
public class CommentedPageDTO {

	private int commentedCnt;
	private List<Writings_CommentedDTO> list;
}