package dao;

import java.util.List;

import command.ReplyCommand;

public interface ReplyDAO {

	/* 댓글 등록 */
	public void addReply(ReplyCommand replyCommand) throws Exception;
	
	/* 댓글 작성 유무 */
	public ReplyCommand checkReply(String memberId, int productId) throws Exception;
	
	/* 전체 댓글 리스트 가져오기 */
	public List<ReplyCommand> getReplyListAll(int productId) throws Exception;
	
	/* 댓글 삭제 */
	public void deleteReply(String memberId, int productId) throws Exception;
	
	/* 댓글 평점 평균 계산 */
	public Double ratingAvg(int productId) throws Exception;
}
