package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import command.ReplyCommand;
import dao.ProductDAO;
import dao.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	ReplyDAO replyDAO;
	@Autowired
	ProductDAO productDAO;
	
	/* 댓글 등록 */
	@Override
	public int addReply(ReplyCommand replyCommand) throws Exception{
		ReplyCommand checkReply = replyDAO.checkReply(replyCommand.getMemberId(), replyCommand.getProductId());
		if(checkReply == null) {
			replyDAO.addReply(replyCommand);
			return 1;
		} else {
			return 0;
		}
	}
	
	/* 댓글 평균 평점 계산 */
	public void updateRatingAvg(int productId) throws Exception{
		Double ratingAvg = replyDAO.ratingAvg(productId);
		if(ratingAvg == null) {
			ratingAvg = 0.0;
			productDAO.updateRatingAvg(ratingAvg, productId);
		} else {
		String.format("%.1f", ratingAvg);
		productDAO.updateRatingAvg(ratingAvg, productId);
		}
	}
	
	/* 전체 댓글 리스트 가져오기 */
	@Override
	public List<ReplyCommand> getReplyListAll(int productId) throws Exception {
		List<ReplyCommand> results = replyDAO.getReplyListAll(productId);
		if(results == null) {
			List<ReplyCommand> result = new ArrayList<ReplyCommand>();
			return result;
		} else {
			return replyDAO.getReplyListAll(productId);
		}

	}
	
	/* 댓글 삭제 */
	@Override
	public void deleteReply(String memberId, int productId) throws Exception {
		replyDAO.deleteReply(memberId, productId);
	}
}
