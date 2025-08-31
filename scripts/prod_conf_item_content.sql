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
-- Name: prod_conf_item_content; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE prod_conf_item_content (
    config_item_id character varying(20) NOT NULL,
    content_id character varying(20) NOT NULL,
    conf_item_content_type_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.prod_conf_item_content OWNER TO ofbiz;

--
-- Name: prod_conf_item_content pk_prod_conf_item_content; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_conf_item_content
    ADD CONSTRAINT pk_prod_conf_item_content PRIMARY KEY (config_item_id, content_id, conf_item_content_type_id, from_date);


--
-- Name: cimt_cnt_cnt; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cimt_cnt_cnt ON prod_conf_item_content USING btree (content_id);


--
-- Name: cimt_cnt_pcit; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cimt_cnt_pcit ON prod_conf_item_content USING btree (config_item_id);


--
-- Name: cimt_cnt_type; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cimt_cnt_type ON prod_conf_item_content USING btree (conf_item_content_type_id);


--
-- Name: prd_cnf_itm_cnt_tp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_cnf_itm_cnt_tp ON prod_conf_item_content USING btree (last_updated_tx_stamp);


--
-- Name: prd_cnf_itm_cnt_ts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prd_cnf_itm_cnt_ts ON prod_conf_item_content USING btree (created_tx_stamp);


--
-- Name: prod_conf_item_content cimt_cnt_cnt; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_conf_item_content
    ADD CONSTRAINT cimt_cnt_cnt FOREIGN KEY (content_id) REFERENCES content(content_id);


--
-- Name: prod_conf_item_content cimt_cnt_pcit; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_conf_item_content
    ADD CONSTRAINT cimt_cnt_pcit FOREIGN KEY (config_item_id) REFERENCES product_config_item(config_item_id);


--
-- Name: prod_conf_item_content cimt_cnt_type; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY prod_conf_item_content
    ADD CONSTRAINT cimt_cnt_type FOREIGN KEY (conf_item_content_type_id) REFERENCES prod_conf_item_content_type(conf_item_content_type_id);


--
-- PostgreSQL database dump complete
--

