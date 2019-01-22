DELIMITER //
create procedure `selectOneBoard`(IN bno int(11))
 
begin
    declare result int(4);
 
    set result = (select count(*) from suggestion
                            where bno=bno
                            and statusCode='S02');
    if (result > 0) then
        select bno, b.mid "mid", b.title "title", b.bContent "bContent",
                DATE_FORMAT(b.writeDate,'%Y-%m-%d') "WriteDate",
                b.readCount "readCount", b.thumbNail "thumbNail",
                b.categoryCode "categoryCode", b.bDelete "bDelete" 
                s.link "link"
        from board b join suggestion s using(bno)
        where b.bDelete='0';
    
    ELSE 
        SELECT bno, mid, title, bContent,
                DATE_FORMAT(writeDate,'%Y-%m-%d') WriteDate,
                readCount, thumbNail, categoryCode, bDelete
        FROM board
        WHERE bDelete='0'
        and bno = bno;
    
    end if;
end;
//
DELIMITER ;