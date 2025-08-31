--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: order_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE order_content (
    order_id character varying(20) NOT NULL,
    order_item_seq_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    order_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.order_content OWNER TO ofbiz;

--
-- Name: order_content pk_order_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_content
    ADD CONSTRAINT pk_order_content PRIMARY KEY (content_id, order_id, order_item_seq_id, order_content_type_id, from_date);


--
-- Name: ord_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ord_cnt_cnt ON order_content USING btree (content_id);


--
-- Name: ord_cnt_prod; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ord_cnt_prod ON order_content USING btree (order_id);


--
-- Name: ord_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ord_cnt_type ON order_content USING btree (order_content_type_id);


--
-- Name: ordr_cntnt_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_cntnt_txcrts ON order_content USING btree (created_tx_stamp);


--
-- Name: ordr_cntnt_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX ordr_cntnt_txstmp ON order_content USING btree (last_updated_tx_stamp);


--
-- Name: order_content ord_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_content
    ADD CONSTRAINT ord_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: order_content ord_cnt_prod; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_content
    ADD CONSTRAINT ord_cnt_prod FOREIGN KEY (order_id) REFERENCES order_header(order_id);


--
-- Name: order_content ord_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY order_content
    ADD CONSTRAINT ord_cnt_type FOREIGN KEY (order_content_type_id) REFERENCES order_content_type(order_content_type_id);


--
-- PostgreSQL database dump complete
--

