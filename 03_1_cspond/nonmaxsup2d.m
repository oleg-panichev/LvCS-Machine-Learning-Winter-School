function maximg=nonmaxsup2d(response,thresh)
  maximg = response;
  H = size(response, 1);
  W = size(response, 2);
  for i=1:H
    i_start = i-1;
    i_r = 2;
    if i_start < 1
      i_start = 1;
      i_r = 1;
    end
    i_end = i+1;
    if i_end > W
      i_end = W;
    end
      
    for j=1:W
      j_start = j-1;
      j_r = 2;
      if j_start < 1
        j_start = 1;
        j_r = 1;
      end
      j_end = j+1;
      if j_end > W
        j_end = W;
      end
      
      R = response(i_start:i_end, j_start:j_end);
      R = R(:);
      linearInd = sub2ind([i_end-i_start+1, j_end-j_start+1], i_r, j_r);
      R(linearInd) = [];
      
      max_val = max(R);
      if (response(i, j) > max_val) && (max_val > thresh)
        maximg(i, j) = 1;
      else
        maximg(i, j) = 0;
      end
    end
  end
end

% function maximg = nonmaxsup2d(response, thresh)
% maximg = zeros(size(response));
% [h, w] = size(response);
% for i = 2:h-1
%     for j = 2:w-1
%         p = response(i-1:i+1,j-1:j+1); p = p(:); p(5) = 0;
%         if ((response(i,j) >= thresh) & (response(i,j) > p))
%             maximg(i,j) = 1;
%         end
%     end
% end

% function maximg = nonmaxsup2d(response, thresh)
% maximg = zeros(size(response));
% [h, w] = size(response);
% for i = 2:h-1
%     for j = 2:w-1
%         p = response(i-1:i+1,j-1:j+1); p = p(:); p(5) = 0;
%         if ((response(i,j) >= thresh) & (response(i,j) > p))
%             maximg(i,j) = 1;
%         end
%     end
% end